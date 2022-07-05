/**
* Once again heaping some digital abuse on the Bird and the Bee. This is a kind of granular synthesis performance patch. Controls are as follows:
* <p/>
* <b>Mouse movement</b>: the screen acts as an x/y controller for the Granulizer. X position controls the size of a grain and Y position controls
* how many times the grain is repeated before a new one is chosen.<br/>
* <b>Hold d</b>: send the ouput through some delay.<br/>
* <b>Hold s</b>: activates the SampleRepeat effect, which will grab a small portion of the current audio and loop it.<br/>
* <b>Hold c</b>: activates a Bit Crush effect which sweeps down to maximum crushage and back up to no crushage when the key is released.<br/>
* <b>Hold e</b>: slowly increases the speed of the entire thing.<br/>
* <b>Hold w</b>: slowly decreases the speed of the entire thing, bottoming out at 0, which creates silence.<br/>
* <b>Hold f and move mouse</b>: enters filter mode which allows the mouse to control the cutoff and resonance of a low pass filter. X controls cutoff, Y controls resonance.
**/

import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.ugens.*;

String sampleSource = "again_loop.aif";

minim;
mainOut;
grains;
repeater;

delaySend;
delaySendCtrl;
delayerLeft;
delayerRight;

crusher;
crusherCtrl;

grainRate;
grainRateCtrl;

mooger;

void setup() { 
  size( 600, 600 );

  colorMode(HSB, 360, 1, 1);

  minim = new Minim(this);
  mainOut = minim.getLineOut();
  
  // load the file into a multichannelbuffer
  AudioSample audio = minim.loadSample( sampleSource, 1024 );
  audio.close();
  MultiChannelBuffer buffer = new MultiChannelBuffer( audio.getChannel(AudioSample.LEFT).length, audio.getFormat().getChannels());
  for( int i = 0; i < audio.getFormat().getChannels(); ++i ){
    buffer.setChannel(i, audio.getChannel(i+1)); 
  }
  
  grains = new Granulizer( buffer, 1024 );
  
  repeater = new SampleRepeat( 120, 0.25f );
  
  crusher  = new BitCrush( 16 );
  crusherCtrl = new Line( 0.f, 16.f, 16.f );
  crusherCtrl.patch( crusher.bitRes ); 
  
  grainRate = new TickRate( 1.f );
  grainRateCtrl = new Line( 0.f, 1.f, 1.f );
  grainRateCtrl.patch( grainRate.value );
  grainRate.setInterpolation( true );
  
  mooger = new MoogFilter( 12000, 0.3f );
  
  Multiplier grainsOut = new Multiplier( 1.f );
  
  grains.patch( crusher ).patch( repeater ).patch( grainRate ).patch( mooger ).patch( grainsOut ).patch( mainOut );
  
  delaySend = new Multiplier();
  delaySendCtrl = new Line( 0.f, 0.f, 0.f );
  delaySendCtrl.patch( delaySend.amplitude );
  grainsOut.patch( delaySend );
  
  delayerLeft = new Delay( 0.25f, 0.8f, true, false );
  Pan pan     = new Pan( -0.8f );
  delaySend.patch( delayerLeft ).patch( pan ).patch( mainOut );
  
  delayerRight = new Delay( 0.3f, 0.8f, true, false );
  pan          = new Pan( 0.8f );
  delaySend.patch( delayerRight ).patch( pan ).patch( mainOut );
}

boolean delayed = false;
boolean crushed = false;
boolean filtering = false;

// a class that will sample and then repeat a section of incoming audio
// while it continues to tick the audio coming into it.
// it is a similar effect to Live's BeatRepeat
public class SampleRepeat extends UGen
{
  UGenInput audio;
  
  // the buffer of audio we will record into and then repeat
  private float[] m_buffer;
  // how long is our sample buffer
  private int m_sampleLength;
  // where are we recording/playing back in our buffer?
  private int m_currSample;
  
  private float m_tempo;
  private float m_sampleLengthInBeats;
  
  private static final int PASS = -1;
  private static final int SAMPLE = 0;
  private static final int REPEAT = 1;
  
  private int m_state;
  
  public SampleRepeat( float tempo, float sampleLengthInBeats )
  {
    audio = new UGenInput();
    m_buffer = null;
    m_tempo = tempo;
    m_sampleLengthInBeats = sampleLengthInBeats;
    m_state = PASS;
  }
  
  void setSampleLength( float tempo, float sampleLengthInBeats )
  {
    m_tempo = tempo;
    m_sampleLengthInBeats = sampleLengthInBeats;
    float beatPerSec = 60.f / tempo;
    m_sampleLength = int(sampleLengthInBeats * sampleRate() * beatPerSec);
  }
  
  void sampleRateChanged()
  {
    setSampleLength( m_tempo, m_sampleLengthInBeats );
  }
  
  boolean isActive() 
  {
    return ( m_state != PASS );
  }
  
  void activate()
  {
    m_state = SAMPLE;
    m_currSample = 0;
  }
  
  void deactivate()
  {
    m_state = PASS;
  }
  
  void uGenerate( float[] channels )
  {
    // reinitialize buffer if things change
    if ( m_buffer == null || m_buffer.length != m_sampleLength * channels.length )
    {
      m_buffer = new float[ m_sampleLength * channels.length ];
    }
        
    switch( m_state )
    {
    case PASS:
      {
        arraycopy( audio.getLastValues(), channels );
      }
      break;
      
    case SAMPLE:
      {
        // pass the audio
        arraycopy( audio.getLastValues(), channels );
        // but also record it
        int offset = m_currSample * channels.length;
        arraycopy( channels, 0, m_buffer, offset, channels.length );
        float fadeIn = constrain( map( m_currSample, 0, 128, 0, 1 ), 0, 1 );
        float fadeOut = constrain( map( m_currSample, m_sampleLength - 128, m_sampleLength, 1, 0 ), 0, 1 );
        for(int i = offset; i < offset + channels.length; i++)
        {
          m_buffer[i] *= fadeIn;
          m_buffer[i] *= fadeOut;
        }
        
        m_currSample++;
        if ( m_currSample == m_sampleLength )
        {
          m_state = REPEAT;
          m_currSample = 0;
        }
      }
      break;
      
    case REPEAT:
      {
        arraycopy( m_buffer, m_currSample * channels.length, channels, 0, channels.length );
        m_currSample = ( m_currSample + 1 ) % m_sampleLength;
      }
      break;
    }
  }
}

void keyPressed()
{ 
  if ( key == 's' && !repeater.isActive() )
  {
    repeater.activate();
  }
  else if ( key == 'd' && !delayed )
  {
    delaySendCtrl.activate( 0.01f, 0.f, 1.f );
    delayed = true;
  }
  else if ( key == 'c' && !crushed )
  {
    crusherCtrl.activate( 0.5f, crusher.bitRes.getLastValue(), 2.f );
    crushed = true;
  }
  else if ( key == 'e' )
  {
    float currentRate = grainRate.value.getLastValue();
    grainRateCtrl.activate( 0.5f, currentRate, currentRate + 0.2f );
  }
  else if ( key == 'w' )
  {
    float currentRate = grainRate.value.getLastValue();
    grainRateCtrl.activate( 0.5f, currentRate, constrain( currentRate - 0.2f, 0.f, currentRate ) );
  }
  else if ( key == 'f' )
  {
    filtering = true;
  }
}

void keyReleased()
{
  if ( key == 's' )
  {
    repeater.deactivate();
  }
  else if ( key == 'd' )
  {
    delaySendCtrl.activate( 0.01f, 1.f, 0.f );
    delayed = false;
  }
  else if ( key == 'c' )
  {
    crusherCtrl.activate( 0.5f, crusher.bitRes.getLastValue(), 16f );
    crushed = false;
  }
  else if ( key == 'w' || key == 'e' )
  {
    grainRateCtrl.activate( 0.5f, grainRate.value.getLastValue(), 1.f );
  }
  else if ( key == 'f' )
  {
    filtering = false;
  }
}

void mouseMoved()
{
  if ( filtering )
  {
    float cutoff = map( mouseX, 0, width, 60, 6000 );
    float res    = map( mouseY, 0, height, 0.8, 0 );
    mooger.frequency.setLastValue( cutoff );
    mooger.resonance.setLastValue( res );
  }
  else
  {
    int gsize = int( map( mouseX, 0, width, 16, 4096 * 4 ) );
    grains.grainSize.setLastValue( gsize ); 
  
    int repeat = int( map( mouseY, 0, height, 2, 16 ) );
    // make sure it's even.
    if ( repeat % 2 != 0 ) repeat++;
    grains.grainRepeat.setLastValue( repeat );
  }
}

//////////////////////////////////////////////////
//
// DRAWING DOWN HERE
//

float waveSize = 150;

float hueForSample( float sample);
{
  return map( abs(sample), 0, 1, 120, 450 );
}

// draw is run many times
void draw()
{
  // erase the window to black
  background( 0 );
  // draw using a white stroke
  stroke( 255 );
  // draw the waveforms
  for( int i = 0; i < mainOut.bufferSize() - 1; i++ ){
    
    // find the x position of each buffer value
    float x1  =  map( i, 0, mainOut.bufferSize(), 0, width );
    float x2  =  map( i+1, 0, mainOut.bufferSize(), 0, width );
    // draw a line from one buffer position to the next for both channels
    stroke( hueForSample(mainOut.left.get(i)), 1, 1 );
    line( x1, height/2 - waveSize + mainOut.left.get(i)*waveSize, x2, height/2 - waveSize + mainOut.left.get(i+1)*waveSize);
    stroke( hueForSample(mainOut.right.get(i)), 1, 1 );
    line( x1, height/2 + waveSize + mainOut.right.get(i)*waveSize, x2, height/2 + waveSize + mainOut.right.get(i+1)*waveSize);
  }  
}

class Granulizer extends UGen
{
  public UGenInput grainSize;
  public UGenInput grainRepeat;
  
  MultiChannelBuffer sampleData;
  int                grainStart;
  int                sampleCount;
  int                sampleLoopCount;
  
  Granulizer( MultiChannelBuffer sourceSample, int grainSizeInSamples )
  {
    grainSize = new UGenInput( InputType.CONTROL );
    grainSize.setLastValue( grainSizeInSamples );
    
    grainRepeat = new UGenInput( InputType.CONTROL );
    grainRepeat.setLastValue( 16 );
    
    sampleData = sourceSample;
  }
  
  protected void uGenerate( float[] out )
  {
    int gsize = (int)grainSize.getLastValue();
    if ( sampleCount >= gsize )
    {
      sampleCount = 0;
      ++sampleLoopCount;
      if ( sampleLoopCount >= (int)grainRepeat.getLastValue() )
      {
        grainStart = int( random( 0, sampleData.getBufferSize() - gsize ) );
        sampleLoopCount = 0;
      }
    }
    
    for( int c = 0; c < out.length; ++c )
    {
      int   sourceChannel = c < sampleData.getChannelCount() ? c : sampleData.getChannelCount() - 1;
      int   sample = grainStart + sampleCount;
      if ( sample >= sampleData.getBufferSize() ) sample -= sampleData.getBufferSize();
      out[c] = sampleData.getSample( sourceChannel, sample );
    }
    
    ++sampleCount;
  }
}

// stop is run when the user presses stop
void stop(){
  // close the AudioOutput
  mainOut.close();
  // stop the minim object
  minim.stop();

  super.stop();
}
