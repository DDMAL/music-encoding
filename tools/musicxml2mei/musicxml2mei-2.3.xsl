<?xml version="1.0" encoding="UTF-8"?>

<!DOCTYPE xsl:stylesheet [
<!ENTITY beamstart     "&#xE501;">
<!ENTITY beamend      "&#xE502;">
<!ENTITY tupletstart     "&#xE503;">
<!ENTITY tupletend      "&#xE504;">
]>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"
  xmlns:mei="http://www.music-encoding.org/ns/mei" xmlns:xlink="http://www.w3.org/1999/xlink"
  xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:f="http://music-encoding.org/tools/musicxml2mei"
  exclude-result-prefixes="mei xs f">

  <xsl:character-map name="delimiters">
    <xsl:output-character character="&beamstart;" string="&lt;beam&gt;"/>
    <xsl:output-character character="&beamend;" string="&lt;/beam&gt;"/>
    <xsl:output-character character="&tupletstart;" string="&lt;tuplet&gt;"/>
    <xsl:output-character character="&tupletend;" string="&lt;/tuplet&gt;"/>
  </xsl:character-map>

  <xsl:output method="xml" indent="yes" encoding="UTF-8" omit-xml-declaration="no" standalone="no"
    use-character-maps="delimiters"/>
  <xsl:strip-space elements="*"/>

  <!-- global variables -->
  <xsl:variable name="nl">
    <xsl:text>&#xa;</xsl:text>
  </xsl:variable>
  <xsl:variable name="progName">
    <xsl:text>musicxml2mei</xsl:text>
  </xsl:variable>
  <xsl:variable name="progVersion">
    <xsl:text>v. 2.3.0</xsl:text>
  </xsl:variable>
  <xsl:variable name="midiNamesPitched">
    <!-- ordered list of General MIDI program names (program numbers 0-127) -->
    <instrName>Acoustic_Grand_Piano</instrName>
    <instrName>Bright_Acoustic_Piano</instrName>
    <instrName>Electric_Grand_Piano</instrName>
    <instrName>Honky-tonk_Piano</instrName>
    <instrName>Electric_Piano_1</instrName>
    <instrName>Electric_Piano_2</instrName>
    <instrName>Harpsichord</instrName>
    <instrName>Clavi</instrName>
    <instrName>Celesta</instrName>
    <instrName>Glockenspiel</instrName>
    <instrName>Music_Box</instrName>
    <instrName>Vibraphone</instrName>
    <instrName>Marimba</instrName>
    <instrName>Xylophone</instrName>
    <instrName>Tubular_Bells</instrName>
    <instrName>Dulcimer</instrName>
    <instrName>Drawbar_Organ</instrName>
    <instrName>Percussive_Organ</instrName>
    <instrName>Rock_Organ</instrName>
    <instrName>Church_Organ</instrName>
    <instrName>Reed_Organ</instrName>
    <instrName>Accordion</instrName>
    <instrName>Harmonica</instrName>
    <instrName>Tango_Accordion</instrName>
    <instrName>Acoustic_Guitar_nylon</instrName>
    <instrName>Acoustic_Guitar_steel</instrName>
    <instrName>Electric_Guitar_jazz</instrName>
    <instrName>Electric_Guitar_clean</instrName>
    <instrName>Electric_Guitar_muted</instrName>
    <instrName>Overdriven_Guitar</instrName>
    <instrName>Distortion_Guitar</instrName>
    <instrName>Guitar_harmonics</instrName>
    <instrName>Acoustic_Bass</instrName>
    <instrName>Electric_Bass_finger</instrName>
    <instrName>Electric_Bass_pick</instrName>
    <instrName>Fretless_Bass</instrName>
    <instrName>Slap_Bass_1</instrName>
    <instrName>Slap_Bass_2</instrName>
    <instrName>Synth_Bass_1</instrName>
    <instrName>Synth_Bass_2</instrName>
    <instrName>Violin</instrName>
    <instrName>Viola</instrName>
    <instrName>Cello</instrName>
    <instrName>Contrabass</instrName>
    <instrName>Tremolo_Strings</instrName>
    <instrName>Pizzicato_Strings</instrName>
    <instrName>Orchestral_Harp</instrName>
    <instrName>Timpani</instrName>
    <instrName>String_Ensemble_1</instrName>
    <instrName>String_Ensemble_2</instrName>
    <instrName>SynthStrings_1</instrName>
    <instrName>SynthStrings_2</instrName>
    <instrName>Choir_Aahs</instrName>
    <instrName>Voice_Oohs</instrName>
    <instrName>Synth_Voice</instrName>
    <instrName>Orchestra_Hit</instrName>
    <instrName>Trumpet</instrName>
    <instrName>Trombone</instrName>
    <instrName>Tuba</instrName>
    <instrName>Muted_Trumpet</instrName>
    <instrName>French_Horn</instrName>
    <instrName>Brass_Section</instrName>
    <instrName>SynthBrass_1</instrName>
    <instrName>SynthBrass_2</instrName>
    <instrName>Soprano_Sax</instrName>
    <instrName>Alto_Sax</instrName>
    <instrName>Tenor_Sax</instrName>
    <instrName>Baritone_Sax</instrName>
    <instrName>Oboe</instrName>
    <instrName>English_Horn</instrName>
    <instrName>Bassoon</instrName>
    <instrName>Clarinet</instrName>
    <instrName>Piccolo</instrName>
    <instrName>Flute</instrName>
    <instrName>Recorder</instrName>
    <instrName>Pan_Flute</instrName>
    <instrName>Blown_Bottle</instrName>
    <instrName>Shakuhachi</instrName>
    <instrName>Whistle</instrName>
    <instrName>Ocarina</instrName>
    <instrName>Lead_1_square</instrName>
    <instrName>Lead_2_sawtooth</instrName>
    <instrName>Lead_3_calliope</instrName>
    <instrName>Lead_4_chiff</instrName>
    <instrName>Lead_5_charang</instrName>
    <instrName>Lead_6_voice</instrName>
    <instrName>Lead_7_fifths</instrName>
    <instrName>Lead_8_bass_and_lead</instrName>
    <instrName>Pad_1_new_age</instrName>
    <instrName>Pad_2_warm</instrName>
    <instrName>Pad_3_polysynth</instrName>
    <instrName>Pad_4_choir</instrName>
    <instrName>Pad_5_bowed</instrName>
    <instrName>Pad_6_metallic</instrName>
    <instrName>Pad_7_halo</instrName>
    <instrName>Pad_8_sweep</instrName>
    <instrName>FX_1_rain</instrName>
    <instrName>FX_2_soundtrack</instrName>
    <instrName>FX_3_crystal</instrName>
    <instrName>FX_4_atmosphere</instrName>
    <instrName>FX_5_brightness</instrName>
    <instrName>FX_6_goblins</instrName>
    <instrName>FX_7_echoes</instrName>
    <instrName>FX_8_sci-fi</instrName>
    <instrName>Sitar</instrName>
    <instrName>Banjo</instrName>
    <instrName>Shamisen</instrName>
    <instrName>Koto</instrName>
    <instrName>Kalimba</instrName>
    <instrName>Bagpipe</instrName>
    <instrName>Fiddle</instrName>
    <instrName>Shanai</instrName>
    <instrName>Tinkle_Bell</instrName>
    <instrName>Agogo</instrName>
    <instrName>Steel_Drums</instrName>
    <instrName>Woodblock</instrName>
    <instrName>Taiko_Drum</instrName>
    <instrName>Melodic_Tom</instrName>
    <instrName>Synth_Drum</instrName>
    <instrName>Reverse_Cymbal</instrName>
    <instrName>Guitar_Fret_Noise</instrName>
    <instrName>Breath_Noise</instrName>
    <instrName>Seashore</instrName>
    <instrName>Bird_Tweet</instrName>
    <instrName>Telephone_Ring</instrName>
    <instrName>Helicopter</instrName>
    <instrName>Applause</instrName>
    <instrName>Gunshot</instrName>
  </xsl:variable>
  <xsl:variable name="midiNamesUnpitched">
    <!-- ordered list of General MIDI percussion instrument names (key numbers 35-81) -->
    <instrName>Acoustic_Bass_Drum</instrName>
    <instrName>Bass_Drum_1</instrName>
    <instrName>Side_Stick</instrName>
    <instrName>Acoustic_Snare</instrName>
    <instrName>Hand_Clap</instrName>
    <instrName>Electric_Snare</instrName>
    <instrName>Low_Floor_Tom</instrName>
    <instrName>Closed_Hi_Hat</instrName>
    <instrName>High_Floor_Tom</instrName>
    <instrName>Pedal_Hi-Hat</instrName>
    <instrName>Low_Tom</instrName>
    <instrName>Open_Hi-Hat</instrName>
    <instrName>Low-Mid_Tom</instrName>
    <instrName>Hi-Mid_Tom</instrName>
    <instrName>Crash_Cymbal_1</instrName>
    <instrName>High_Tom</instrName>
    <instrName>Ride_Cymbal_1</instrName>
    <instrName>Chinese_Cymbal</instrName>
    <instrName>Ride_Bell</instrName>
    <instrName>Tambourine</instrName>
    <instrName>Splash_Cymbal</instrName>
    <instrName>Cowbell</instrName>
    <instrName>Crash_Cymbal_2</instrName>
    <instrName>Vibraslap</instrName>
    <instrName>Ride_Cymbal_2</instrName>
    <instrName>Hi_Bongo</instrName>
    <instrName>Low_Bongo</instrName>
    <instrName>Mute_Hi_Conga</instrName>
    <instrName>Open_Hi_Conga</instrName>
    <instrName>Low_Conga</instrName>
    <instrName>High_Timbale</instrName>
    <instrName>Low_Timbale</instrName>
    <instrName>High_Agogo</instrName>
    <instrName>Low_Agogo</instrName>
    <instrName>Cabasa</instrName>
    <instrName>Maracas</instrName>
    <instrName>Short_Whistle</instrName>
    <instrName>Long_Whistle</instrName>
    <instrName>Short_Guiro</instrName>
    <instrName>Long_Guiro</instrName>
    <instrName>Claves</instrName>
    <instrName>Hi_Wood_Block</instrName>
    <instrName>Low_Wood_Block</instrName>
    <instrName>Mute_Cuica</instrName>
    <instrName>Open_Cuica</instrName>
    <instrName>Mute_Triangle</instrName>
    <instrName>Open_Triangle</instrName>
  </xsl:variable>
  <xsl:variable name="scorePPQ">
    <xsl:variable name="staffPPQvalues">
      <xsl:for-each select="//measure[1]//attributes/divisions[not(.=following::divisions)]">
        <xsl:sort data-type="number"/>
        <xsl:copy-of select="."/>
      </xsl:for-each>
    </xsl:variable>
    <xsl:choose>
      <xsl:when test="count($staffPPQvalues//divisions) = 1">
        <xsl:value-of select="$staffPPQvalues//divisions[1]"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:call-template name="leastCommonMultiple">
          <xsl:with-param name="in">
            <xsl:copy-of select="$staffPPQvalues"/>
          </xsl:with-param>
        </xsl:call-template>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:variable>
  <xsl:variable name="defaultLayout">
    <xsl:choose>
      <xsl:when test="score-timewise">
        <xsl:apply-templates select="score-timewise/part-list" mode="layout"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:variable name="errorMessage">The source file is not a time-wise MusicXML
          file!</xsl:variable>
        <xsl:message terminate="yes">
          <xsl:value-of select="normalize-space($errorMessage)"/>
        </xsl:message>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:variable>

  <!-- 'Match' templates -->
  <xsl:template match="/">
    <mei xmlns="http://www.music-encoding.org/ns/mei" meiversion="2012">
      <xsl:apply-templates select="score-timewise" mode="header"/>
      <xsl:apply-templates select="score-timewise" mode="music"/>
    </mei>
  </xsl:template>

  <xsl:template match="*" mode="insertSpace">
    <!-- Insert a time-filling space -->
    <xsl:if test="not(@grace)">
      <space xmlns="http://www.music-encoding.org/ns/mei">
        <xsl:attribute name="xml:id">
          <xsl:value-of select="generate-id()"/>
        </xsl:attribute>
        <xsl:copy-of select="@tstamp.ges|@dur|@dots|@dur.ges|@part|@layer|@staff"/>
        <xsl:choose>
          <xsl:when test="@beam">
            <xsl:copy-of select="@beam"/>
          </xsl:when>
          <xsl:when test="*[@beam]">
            <xsl:copy-of select="*[@beam][1]/@beam"/>
          </xsl:when>
        </xsl:choose>
      </space>
    </xsl:if>
  </xsl:template>

  <xsl:template match="attributes" mode="stage1">
    <!-- check for MusicXML attributes that don't begin a measure -->
    <xsl:if test="count(following-sibling::*[not(name()='barline')])=0 or preceding-sibling::note or
      preceding-sibling::forward or preceding-sibling::chord">
      <xsl:for-each select="clef">
        <clef xmlns="http://www.music-encoding.org/ns/mei">
          <xsl:attribute name="xml:id">
            <xsl:value-of select="generate-id()"/>
          </xsl:attribute>
          <xsl:variable name="partID">
            <xsl:value-of select="ancestor::part[1]/@id"/>
          </xsl:variable>
          <xsl:variable name="partStaff">
            <xsl:choose>
              <xsl:when test="@number">
                <xsl:value-of select="@number"/>
              </xsl:when>
              <xsl:otherwise>1</xsl:otherwise>
            </xsl:choose>
          </xsl:variable>
          <xsl:attribute name="part">
            <xsl:value-of select="$partID"/>
          </xsl:attribute>
          <xsl:attribute name="layer">
            <xsl:choose>
              <!-- Mid-measure attributes are preceded by note/rest -->
              <xsl:when test="following::note[1]/voice">
                <xsl:value-of select="following::note[1]/voice"/>
              </xsl:when>
              <!-- Measure-ending attributes have no following sibling notes -->
              <xsl:when test="preceding::note[1]/voice">
                <xsl:value-of select="preceding::note[1]/voice"/>
              </xsl:when>
              <xsl:otherwise>
                <xsl:text>1</xsl:text>
              </xsl:otherwise>
            </xsl:choose>
          </xsl:attribute>
          <xsl:attribute name="staff">
            <xsl:call-template name="getStaffNum">
              <xsl:with-param name="partID">
                <xsl:value-of select="$partID"/>
              </xsl:with-param>
              <xsl:with-param name="partStaff">
                <xsl:value-of select="$partStaff"/>
              </xsl:with-param>
            </xsl:call-template>
          </xsl:attribute>
          <xsl:attribute name="tstamp">
            <xsl:call-template name="tstamp.ges2beat">
              <xsl:with-param name="tstamp.ges">
                <xsl:call-template name="getTimestamp.ges"/>
              </xsl:with-param>
            </xsl:call-template>
          </xsl:attribute>
          <xsl:attribute name="tstamp.ges">
            <xsl:call-template name="getTimestamp.ges"/>
          </xsl:attribute>
          <xsl:attribute name="shape">
            <xsl:choose>
              <xsl:when test="sign='percussion'">
                <xsl:text>perc</xsl:text>
              </xsl:when>
              <xsl:otherwise>
                <xsl:value-of select="sign"/>
              </xsl:otherwise>
            </xsl:choose>
          </xsl:attribute>
          <xsl:attribute name="line">
            <xsl:value-of select="line"/>
          </xsl:attribute>
          <xsl:if test="clef-octave-change">
            <xsl:if test="abs(number(clef-octave-change)) != 0">
              <xsl:attribute name="trans">
                <xsl:choose>
                  <xsl:when test="clef-octave-change = '2'">15va</xsl:when>
                  <xsl:when test="clef-octave-change = '1'">8va</xsl:when>
                  <xsl:when test="clef-octave-change = '-1'">8vb</xsl:when>
                  <xsl:when test="clef-octave-change = '-2'">15vb</xsl:when>
                </xsl:choose>
              </xsl:attribute>
            </xsl:if>
          </xsl:if>
        </clef>
      </xsl:for-each>
    </xsl:if>
  </xsl:template>

  <xsl:template match="backup" mode="stage1">
    <!-- This is a no-op!  Backup elements don't require any action in MEI. -->
  </xsl:template>

  <xsl:template match="caesura" mode="stage1">
    <!-- In MEI a caesura is a directive -->
    <dir xmlns="http://www.music-encoding.org/ns/mei">
      <xsl:attribute name="tstamp">
        <xsl:call-template name="tstamp.ges2beat">
          <xsl:with-param name="tstamp.ges">
            <xsl:call-template name="getTimestamp.ges"/>
          </xsl:with-param>
        </xsl:call-template>
      </xsl:attribute>
      <xsl:attribute name="tstamp.ges">
        <xsl:for-each select="ancestor::note[1]">
          <xsl:call-template name="getTimestamp.ges"/>
        </xsl:for-each>
      </xsl:attribute>
      <xsl:variable name="partID">
        <xsl:value-of select="ancestor::part[1]/@id"/>
      </xsl:variable>
      <xsl:variable name="partstaff">
        <xsl:choose>
          <xsl:when test="ancestor::note[1]/staff">
            <xsl:value-of select="ancestor::note[1]/staff"/>
          </xsl:when>
          <xsl:otherwise>1</xsl:otherwise>
        </xsl:choose>
      </xsl:variable>
      <xsl:attribute name="staff">
        <xsl:call-template name="getStaffNum">
          <xsl:with-param name="partID">
            <xsl:value-of select="$partID"/>
          </xsl:with-param>
          <xsl:with-param name="partStaff">
            <xsl:value-of select="$partstaff"/>
          </xsl:with-param>
        </xsl:call-template>
      </xsl:attribute>
      <xsl:attribute name="place">
        <xsl:choose>
          <xsl:when test="@placement != ''">
            <xsl:value-of select="@placement"/>
          </xsl:when>
          <xsl:otherwise>above</xsl:otherwise>
        </xsl:choose>
      </xsl:attribute>
      <xsl:attribute name="startid">
        <xsl:for-each select="ancestor::note[1]">
          <xsl:value-of select="generate-id()"/>
        </xsl:for-each>
      </xsl:attribute>
      <xsl:call-template name="positionRelative"/>
      <xsl:text>//</xsl:text>
    </dir>
  </xsl:template>

  <xsl:template match="defaults">
    <!-- Process various font options -->
    <xsl:for-each select="music-font">
      <xsl:attribute name="music.name">
        <xsl:value-of select="@font-family"/>
      </xsl:attribute>
      <xsl:attribute name="music.size">
        <xsl:value-of select="@font-size"/>
        <!-- <xsl:text>pt</xsl:text> -->
      </xsl:attribute>
    </xsl:for-each>
    <xsl:for-each select="word-font">
      <xsl:attribute name="text.name">
        <xsl:value-of select="@font-family"/>
      </xsl:attribute>
      <xsl:attribute name="text.size">
        <xsl:value-of select="@font-size"/>
        <!-- <xsl:text>pt</xsl:text> -->
      </xsl:attribute>
    </xsl:for-each>
    <xsl:for-each select="lyric-font">
      <xsl:attribute name="lyric.name">
        <xsl:value-of select="@font-family"/>
      </xsl:attribute>
      <xsl:attribute name="lyric.size">
        <xsl:value-of select="@font-size"/>
        <!-- <xsl:text>pt</xsl:text> -->
      </xsl:attribute>
    </xsl:for-each>
    <!-- The most useful measure of distance for layout purposes is a
      "virtual unit", which is defined as half the distance between the
      vertical center point of a staff line and that of an adjacent staff line.
      So that virtual unit values can be translated into real-world measurements
      later, the real-world height of a virtual unit must be recorded here. -->
    <xsl:for-each select="scaling">
      <xsl:variable name="mm">
        <xsl:value-of select="millimeters"/>
      </xsl:variable>
      <xsl:attribute name="vu.height">
        <xsl:value-of select="$mm div 8"/>
        <xsl:text>mm</xsl:text>
      </xsl:attribute>
    </xsl:for-each>
    <!-- Page layout options -->
    <xsl:for-each select="page-layout">
      <xsl:attribute name="page.height">
        <xsl:value-of select="format-number(page-height div 5, '###0.########')"/>
        <!-- <xsl:text>vu</xsl:text> -->
      </xsl:attribute>
      <xsl:attribute name="page.width">
        <xsl:value-of select="format-number(page-width div 5,'###0.########')"/>
        <!-- <xsl:text>vu</xsl:text> -->
      </xsl:attribute>
      <xsl:for-each select="page-margins[1]">
        <xsl:attribute name="page.leftmar">
          <xsl:value-of select="format-number(left-margin div 5, '###0.########')"/>
          <!-- <xsl:text>vu</xsl:text> -->
        </xsl:attribute>
        <xsl:attribute name="page.rightmar">
          <xsl:value-of select="format-number(right-margin div 5, '###0.########')"/>
          <!-- <xsl:text>vu</xsl:text> -->
        </xsl:attribute>
        <xsl:attribute name="page.topmar">
          <xsl:value-of select="format-number(top-margin div 5, '###0.########')"/>
          <!-- <xsl:text>vu</xsl:text> -->
        </xsl:attribute>
        <xsl:attribute name="page.botmar">
          <xsl:value-of select="format-number(bottom-margin div 5, '###0.########')"/>
          <!-- <xsl:text>vu</xsl:text> -->
        </xsl:attribute>
      </xsl:for-each>
    </xsl:for-each>
    <!-- System layout options -->
    <xsl:for-each select="system-layout">
      <xsl:for-each select="system-margins">
        <xsl:attribute name="system.leftmar">
          <xsl:value-of select="format-number(left-margin div 5, '###0.########')"/>
          <!-- <xsl:text>vu</xsl:text> -->
        </xsl:attribute>
        <xsl:attribute name="system.rightmar">
          <xsl:value-of select="format-number(right-margin div 5, '###0.########')"/>
          <!-- <xsl:text>vu</xsl:text> -->
        </xsl:attribute>
      </xsl:for-each>
      <xsl:for-each select="system-distance">
        <xsl:attribute name="spacing.system">
          <xsl:value-of select="format-number(.  div 5, '###0.########')"/>
          <!-- <xsl:text>vu</xsl:text> -->
        </xsl:attribute>
      </xsl:for-each>
      <xsl:for-each select="top-system-distance">
        <xsl:attribute name="system.topmar">
          <xsl:value-of select="format-number(.  div 5, '###0.########')"/>
          <!-- <xsl:text>vu</xsl:text> -->
        </xsl:attribute>
      </xsl:for-each>
    </xsl:for-each>
    <!-- Staff layout options -->
    <xsl:for-each select="staff-layout">
      <xsl:for-each select="staff-distance">
        <xsl:attribute name="spacing.staff">
          <xsl:value-of select="format-number(.  div 5, '###0.########')"/>
          <!-- <xsl:text>vu</xsl:text> -->
        </xsl:attribute>
      </xsl:for-each>
    </xsl:for-each>
  </xsl:template>

  <xsl:template match="note/notations/dynamics" mode="stage1">
    <!-- Dynamics -->
    <dynam xmlns="http://www.music-encoding.org/ns/mei">
      <xsl:variable name="tstampGestural">
        <xsl:for-each select="ancestor::direction[1]">
          <xsl:call-template name="getTimestamp.ges"/>
        </xsl:for-each>
      </xsl:variable>
      <xsl:attribute name="tstamp">
        <xsl:call-template name="tstamp.ges2beat">
          <xsl:with-param name="tstamp.ges">
            <xsl:call-template name="getTimestamp.ges"/>
          </xsl:with-param>
        </xsl:call-template>
      </xsl:attribute>
      <xsl:attribute name="tstamp.ges">
        <xsl:for-each select="ancestor::note[1]">
          <xsl:call-template name="getTimestamp.ges"/>
        </xsl:for-each>
      </xsl:attribute>
      <xsl:attribute name="place">
        <xsl:choose>
          <xsl:when test="@placement != ''">
            <xsl:value-of select="@placement"/>
          </xsl:when>
          <xsl:otherwise>below</xsl:otherwise>
        </xsl:choose>
      </xsl:attribute>
      <xsl:variable name="partID">
        <xsl:value-of select="ancestor::part[1]/@id"/>
      </xsl:variable>
      <xsl:variable name="partStaff">
        <xsl:choose>
          <xsl:when test="ancestor::note[1]/staff">
            <xsl:value-of select="ancestor::note[1]/staff"/>
          </xsl:when>
          <xsl:otherwise>1</xsl:otherwise>
        </xsl:choose>
      </xsl:variable>
      <xsl:attribute name="staff">
        <xsl:call-template name="getStaffNum">
          <xsl:with-param name="partID">
            <xsl:value-of select="$partID"/>
          </xsl:with-param>
          <xsl:with-param name="partStaff">
            <xsl:value-of select="$partStaff"/>
          </xsl:with-param>
        </xsl:call-template>
      </xsl:attribute>
      <xsl:call-template name="positionRelative"/>
      <xsl:variable name="content">
        <xsl:for-each select="*">
          <xsl:choose>
            <xsl:when test="name()='other-dynamics'">
              <xsl:value-of select="."/>
              <xsl:if test="position() != last()">
                <xsl:text>&#32;</xsl:text>
              </xsl:if>
            </xsl:when>
            <xsl:otherwise>
              <xsl:value-of select="name()"/>
              <xsl:if test="position() != last()">
                <xsl:text>&#32;</xsl:text>
              </xsl:if>
            </xsl:otherwise>
          </xsl:choose>
        </xsl:for-each>
      </xsl:variable>
      <xsl:choose>
        <xsl:when test="@font-family | @font-style | @font-size | @font-weight | @letter-spacing |
          @line-height | @justify | @halign | @valign | @color | @rotation | @xml:space |
          @underline | @overline | @line-through | @dir | @enclosure">
          <xsl:call-template name="wrapRend">
            <xsl:with-param name="in">
              <xsl:copy-of select="$content"/>
            </xsl:with-param>
          </xsl:call-template>
        </xsl:when>
        <xsl:otherwise>
          <xsl:copy-of select="$content"/>
        </xsl:otherwise>
      </xsl:choose>
    </dynam>
  </xsl:template>

  <xsl:template match="direction" mode="stage1">
    <!-- Make appropriate MEI elements.  Some MusicXML direction types (brackets, coda, dashes,
         damp, damp-all, eyeglasses, harp-pedals, and scordatura) are not handled yet. -->
    <xsl:choose>
      <xsl:when test="count(direction-type) &gt; 1 and count(direction-type/words) +
        count(direction-type/metronome) = count(direction-type/*)">
        <!-- Tempo indicated with text and metronome marking -->
        <tempo xmlns="http://www.music-encoding.org/ns/mei">
          <xsl:variable name="tstampGestural">
            <xsl:call-template name="getTimestamp.ges"/>
          </xsl:variable>
          <xsl:attribute name="tstamp">
            <xsl:call-template name="tstamp.ges2beat">
              <xsl:with-param name="tstamp.ges">
                <xsl:choose>
                  <xsl:when test="number(ancestor::direction[1]/offset) and
                    not(ancestor::direction[1]/direction-type/dynamics/@default-x)">
                    <xsl:value-of select="number($tstampGestural) +
                      number(ancestor::direction[1]/offset)"/>
                  </xsl:when>
                  <xsl:otherwise>
                    <xsl:value-of select="number($tstampGestural)"/>
                  </xsl:otherwise>
                </xsl:choose>
              </xsl:with-param>
            </xsl:call-template>
          </xsl:attribute>
          <xsl:attribute name="tstamp.ges">
            <xsl:choose>
              <xsl:when test="number(ancestor::direction[1]/offset[@sound='yes'])">
                <xsl:value-of select="$tstampGestural +
                  number(ancestor::direction[1]/offset[@sound='yes'])"/>
              </xsl:when>
              <xsl:otherwise>
                <xsl:value-of select="$tstampGestural"/>
              </xsl:otherwise>
            </xsl:choose>
          </xsl:attribute>
          <xsl:variable name="partID">
            <xsl:value-of select="ancestor::part[1]/@id"/>
          </xsl:variable>
          <xsl:variable name="partStaff">
            <xsl:choose>
              <xsl:when test="ancestor::direction[1]/staff">
                <xsl:value-of select="ancestor::direction[1]/staff"/>
              </xsl:when>
              <xsl:otherwise>1</xsl:otherwise>
            </xsl:choose>
          </xsl:variable>
          <xsl:attribute name="staff">
            <xsl:call-template name="getStaffNum">
              <xsl:with-param name="partID">
                <xsl:value-of select="$partID"/>
              </xsl:with-param>
              <xsl:with-param name="partStaff">
                <xsl:value-of select="$partStaff"/>
              </xsl:with-param>
            </xsl:call-template>
          </xsl:attribute>
          <xsl:attribute name="place">
            <xsl:choose>
              <xsl:when test="ancestor::direction/@placement != ''">
                <xsl:value-of select="ancestor::direction/@placement"/>
              </xsl:when>
              <xsl:otherwise>above</xsl:otherwise>
            </xsl:choose>
          </xsl:attribute>
          <xsl:call-template name="positionRelative"/>
          <xsl:attribute name="mm.unit">
            <xsl:for-each select="direction-type/metronome/beat-unit">
              <xsl:call-template name="notatedDuration"/>
            </xsl:for-each>
          </xsl:attribute>
          <xsl:if test="direction-type/metronome/beat-unit-dot">
            <xsl:attribute name="mm.dots">
              <xsl:value-of select="count(direction-type/metronome/beat-unit-dot)"/>
            </xsl:attribute>
          </xsl:if>
          <xsl:attribute name="mm">
            <xsl:value-of select="direction-type/metronome/per-minute"/>
          </xsl:attribute>
          <xsl:if test="sound[@tempo]">
            <xsl:attribute name="midi.tempo">
              <xsl:value-of select="sound/@tempo"/>
            </xsl:attribute>
          </xsl:if>
          <xsl:for-each select="direction-type/words | direction-type/metronome">
            <xsl:variable name="content">
              <xsl:choose>
                <xsl:when test="local-name(.) = 'metronome'">
                  <xsl:if test="@parentheses='yes'">
                    <xsl:text>(</xsl:text>
                  </xsl:if>
                  <xsl:for-each select="beat-unit">
                    <xsl:call-template name="notatedDurationUnicode"/>
                  </xsl:for-each>
                  <xsl:for-each select="beat-unit-dot">
                    <!--<xsl:text>&#x1D16D;</xsl:text>-->
                    <xsl:comment>[.]</xsl:comment>
                  </xsl:for-each>
                  <xsl:text>=</xsl:text>
                  <xsl:value-of select="per-minute"/>
                  <xsl:if test="@parentheses='yes'">
                    <xsl:text>)</xsl:text>
                  </xsl:if>
                </xsl:when>
                <xsl:when test="local-name(.) = 'words'">
                  <xsl:value-of select="normalize-space(.)"/>
                </xsl:when>
              </xsl:choose>
            </xsl:variable>
            <xsl:choose>
              <xsl:when test="@font-family | @font-style | @font-size | @font-weight |
                @letter-spacing | @line-height | @justify | @halign | @valign | @color |
                @rotation | @xml:space | @underline | @overline | @line-through | @dir |
                @enclosure">
                <xsl:call-template name="wrapRend">
                  <xsl:with-param name="in">
                    <xsl:copy-of select="$content"/>
                  </xsl:with-param>
                </xsl:call-template>
              </xsl:when>
              <xsl:otherwise>
                <xsl:copy-of select="$content"/>
              </xsl:otherwise>
            </xsl:choose>
          </xsl:for-each>
        </tempo>
      </xsl:when>
      <xsl:otherwise>
        <!-- Process the various direction types separately -->
        <xsl:for-each select="direction-type/dynamics">
          <dynam xmlns="http://www.music-encoding.org/ns/mei">
            <xsl:call-template name="dirBasicAttrs"/>
            <xsl:attribute name="place">
              <xsl:choose>
                <xsl:when test="ancestor::direction/@placement != ''">
                  <xsl:value-of select="ancestor::direction/@placement"/>
                </xsl:when>
                <xsl:otherwise>below</xsl:otherwise>
              </xsl:choose>
            </xsl:attribute>
            <xsl:call-template name="positionRelative"/>
            <xsl:if test="ancestor::direction/sound[@dynamics]">
              <xsl:attribute name="val">
                <xsl:value-of select="ancestor::direction/sound/@dynamics"/>
              </xsl:attribute>
            </xsl:if>
            <xsl:variable name="content">
              <xsl:for-each select="*">
                <xsl:choose>
                  <xsl:when test="name()='other-dynamics'">
                    <xsl:value-of select="."/>
                    <xsl:if test="position() != last()">
                      <xsl:text>&#32;</xsl:text>
                    </xsl:if>
                  </xsl:when>
                  <xsl:otherwise>
                    <xsl:value-of select="name()"/>
                    <xsl:if test="position() != last()">
                      <xsl:text>&#32;</xsl:text>
                    </xsl:if>
                  </xsl:otherwise>
                </xsl:choose>
              </xsl:for-each>
            </xsl:variable>
            <xsl:choose>
              <xsl:when test="@font-family | @font-style | @font-size | @font-weight |
                @letter-spacing | @line-height | @justify | @halign | @valign | @color |
                @rotation | @xml:space | @underline | @overline | @line-through | @dir |
                @enclosure">
                <xsl:call-template name="wrapRend">
                  <xsl:with-param name="in">
                    <xsl:copy-of select="$content"/>
                  </xsl:with-param>
                </xsl:call-template>
              </xsl:when>
              <xsl:otherwise>
                <xsl:copy-of select="$content"/>
              </xsl:otherwise>
            </xsl:choose>
          </dynam>
        </xsl:for-each>
        <xsl:for-each select="direction-type/metronome">
          <tempo xmlns="http://www.music-encoding.org/ns/mei">
            <xsl:call-template name="dirBasicAttrs"/>
            <xsl:attribute name="place">
              <xsl:choose>
                <xsl:when test="ancestor::direction/@placement != ''">
                  <xsl:value-of select="ancestor::direction/@placement"/>
                </xsl:when>
                <xsl:otherwise>above</xsl:otherwise>
              </xsl:choose>
            </xsl:attribute>
            <xsl:call-template name="positionRelative"/>
            <xsl:attribute name="mm.unit">
              <xsl:for-each select="beat-unit">
                <xsl:call-template name="notatedDuration"/>
              </xsl:for-each>
            </xsl:attribute>
            <xsl:if test="beat-unit-dot">
              <xsl:attribute name="mm.dots">
                <xsl:value-of select="count(beat-unit-dot)"/>
              </xsl:attribute>
            </xsl:if>
            <xsl:attribute name="mm">
              <xsl:value-of select="per-minute"/>
            </xsl:attribute>
            <xsl:if test="ancestor::direction[1]/sound[@tempo]">
              <xsl:attribute name="midi.tempo">
                <xsl:value-of select="ancestor::direction[1]/sound/@tempo"/>
              </xsl:attribute>
            </xsl:if>
            <xsl:variable name="content">
              <xsl:if test="@parentheses='yes'">
                <xsl:text>(</xsl:text>
              </xsl:if>
              <xsl:for-each select="beat-unit">
                <xsl:call-template name="notatedDurationUnicode"/>
              </xsl:for-each>
              <xsl:for-each select="beat-unit-dot">
                <!--<xsl:text>&#x1D16D;</xsl:text>-->
                <xsl:comment>[.]</xsl:comment>
              </xsl:for-each>
              <xsl:text>=</xsl:text>
              <xsl:value-of select="per-minute"/>
              <xsl:if test="@parentheses='yes'">
                <xsl:text>)</xsl:text>
              </xsl:if>
            </xsl:variable>
            <xsl:choose>
              <xsl:when test="@font-family | @font-style | @font-size | @font-weight |
                @letter-spacing | @line-height | @justify | @halign | @valign | @color |
                @rotation | @xml:space | @underline | @overline | @line-through | @dir |
                @enclosure">
                <xsl:call-template name="wrapRend">
                  <xsl:with-param name="in">
                    <xsl:copy-of select="$content"/>
                  </xsl:with-param>
                </xsl:call-template>
              </xsl:when>
              <xsl:otherwise>
                <xsl:copy-of select="$content"/>
              </xsl:otherwise>
            </xsl:choose>
          </tempo>
        </xsl:for-each>
        <xsl:for-each select="direction-type/octave-shift[not(@type='stop')]">
          <!-- Assumes octave-shift elements are NOT nested, i.e., they have no number attributes -->
          <octave xmlns="http://www.music-encoding.org/ns/mei">
            <xsl:call-template name="dirBasicAttrs"/>
            <xsl:attribute name="dis">
              <xsl:value-of select="@size"/>
            </xsl:attribute>
            <xsl:attribute name="dis.place">
              <xsl:choose>
                <xsl:when test="@type='up'">below</xsl:when>
                <xsl:when test="@type='down'">above</xsl:when>
              </xsl:choose>
            </xsl:attribute>
            <xsl:call-template name="positionRelative"/>
            <xsl:attribute name="dur">
              <xsl:variable name="startMeasureID">
                <xsl:value-of select="generate-id(ancestor::measure[1])"/>
              </xsl:variable>
              <xsl:variable name="startMeasurePos">
                <xsl:for-each select="//measure">
                  <xsl:if test="generate-id()=$startMeasureID">
                    <xsl:value-of select="position()"/>
                  </xsl:if>
                </xsl:for-each>
              </xsl:variable>
              <xsl:variable name="partID">
                <xsl:value-of select="ancestor::part[1]/@id"/>
              </xsl:variable>
              <xsl:for-each select="following::direction[direction-type/octave-shift[@type='stop']
                and ancestor::part[1]/@id=$partID][1]">
                <xsl:variable name="endMeasureID">
                  <xsl:value-of select="generate-id(ancestor::measure[1])"/>
                </xsl:variable>
                <xsl:variable name="endMeasurePos">
                  <xsl:for-each select="//measure">
                    <xsl:if test="generate-id()=$endMeasureID">
                      <xsl:value-of select="position()"/>
                    </xsl:if>
                  </xsl:for-each>
                </xsl:variable>
                <xsl:value-of select="$endMeasurePos - $startMeasurePos"/>
                <xsl:text>m+</xsl:text>
                <xsl:call-template name="tstamp.ges2beat">
                  <xsl:with-param name="tstamp.ges">
                    <xsl:call-template name="getTimestamp.ges"/>
                  </xsl:with-param>
                </xsl:call-template>
              </xsl:for-each>
            </xsl:attribute>
          </octave>
        </xsl:for-each>
        <xsl:for-each select="direction-type/pedal">
          <pedal xmlns="http://www.music-encoding.org/ns/mei">
            <xsl:call-template name="dirBasicAttrs"/>
            <xsl:attribute name="place">below</xsl:attribute>
            <xsl:call-template name="positionRelative"/>
            <xsl:attribute name="dir">
              <xsl:choose>
                <xsl:when test="@type='start'">down</xsl:when>
                <xsl:when test="@type='stop'">up</xsl:when>
                <xsl:when test="@type='change'">half</xsl:when>
              </xsl:choose>
            </xsl:attribute>
            <xsl:attribute name="style">
              <xsl:choose>
                <xsl:when test="@line='yes'">line</xsl:when>
                <xsl:otherwise>pedstar</xsl:otherwise>
              </xsl:choose>
            </xsl:attribute>
          </pedal>
        </xsl:for-each>
        <xsl:for-each select="direction-type/wedge[not(@type='stop')]">
          <hairpin xmlns="http://www.music-encoding.org/ns/mei">
            <xsl:call-template name="dirBasicAttrs"/>
            <xsl:attribute name="place">
              <xsl:choose>
                <xsl:when test="ancestor::direction/@placement != ''">
                  <xsl:value-of select="ancestor::direction/@placement"/>
                </xsl:when>
                <xsl:otherwise>below</xsl:otherwise>
              </xsl:choose>
            </xsl:attribute>
            <xsl:choose>
              <xsl:when test="@type='crescendo'">
                <xsl:attribute name="form">cres</xsl:attribute>
              </xsl:when>
              <xsl:when test="@type='diminuendo'">
                <xsl:attribute name="form">dim</xsl:attribute>
              </xsl:when>
            </xsl:choose>
            <xsl:call-template name="positionRelative"/>
            <xsl:variable name="startMeasureID">
              <xsl:value-of select="generate-id(ancestor::measure[1])"/>
            </xsl:variable>
            <xsl:variable name="startMeasurePos">
              <xsl:for-each select="//measure">
                <xsl:if test="generate-id()=$startMeasureID">
                  <xsl:value-of select="position()"/>
                </xsl:if>
              </xsl:for-each>
            </xsl:variable>
            <xsl:choose>
              <xsl:when test="@number">
                <xsl:variable name="hairpinNum">
                  <xsl:value-of select="@number"/>
                </xsl:variable>
                <xsl:for-each select="following::direction[direction-type/wedge[@number=$hairpinNum
                  and @type='stop']][1]">
                  <xsl:variable name="endMeasureID">
                    <xsl:value-of select="generate-id(ancestor::measure[1])"/>
                  </xsl:variable>
                  <xsl:variable name="endMeasurePos">
                    <xsl:for-each select="//measure">
                      <xsl:if test="generate-id()=$endMeasureID">
                        <xsl:value-of select="position()"/>
                      </xsl:if>
                    </xsl:for-each>
                  </xsl:variable>
                  <xsl:attribute name="dur">
                    <xsl:value-of select="$endMeasurePos - $startMeasurePos"/>
                    <xsl:text>m+</xsl:text>
                    <xsl:variable name="tstampGestural">
                      <xsl:call-template name="getTimestamp.ges"/>
                    </xsl:variable>
                    <xsl:call-template name="tstamp.ges2beat">
                      <xsl:with-param name="tstamp.ges">
                        <xsl:choose>
                          <!-- Using offset until it can be determined how to use @default-x -->
                          <xsl:when test="number(offset)">
                            <xsl:value-of select="format-number(number($tstampGestural) +
                              number(offset), '###0.########')"/>
                          </xsl:when>
                          <!--<xsl:when test="number(ancestor::direction[1]/offset) and
                            not(ancestor::direction[1]/direction-type/dynamics/@default-x)">
                            <xsl:value-of select="number($tstampGestural) +
                              number(ancestor::direction[1]/offset)"/>
                          </xsl:when>-->
                          <xsl:otherwise>
                            <xsl:value-of select="number($tstampGestural)"/>
                          </xsl:otherwise>
                        </xsl:choose>
                      </xsl:with-param>
                    </xsl:call-template>
                  </xsl:attribute>
                  <xsl:if test="@spread">
                    <xsl:attribute name="opening">
                      <xsl:value-of select="format-number(@spread  div 5, '###0.########')"/>
                    </xsl:attribute>
                  </xsl:if>
                </xsl:for-each>
              </xsl:when>
              <xsl:otherwise>
                <xsl:for-each select="following::direction[direction-type/wedge[@type='stop']][1]">
                  <xsl:variable name="endMeasureID">
                    <xsl:value-of select="generate-id(ancestor::measure[1])"/>
                  </xsl:variable>
                  <xsl:variable name="endMeasurePos">
                    <xsl:for-each select="//measure">
                      <xsl:if test="generate-id()=$endMeasureID">
                        <xsl:value-of select="position()"/>
                      </xsl:if>
                    </xsl:for-each>
                  </xsl:variable>
                  <xsl:attribute name="dur">
                    <xsl:value-of select="$endMeasurePos - $startMeasurePos"/>
                    <xsl:text>m+</xsl:text>
                    <xsl:variable name="tstampGestural">
                      <xsl:call-template name="getTimestamp.ges"/>
                    </xsl:variable>
                    <xsl:call-template name="tstamp.ges2beat">
                      <xsl:with-param name="tstamp.ges">
                        <xsl:choose>
                          <!-- Using offset until it can be determined how to use @default-x -->
                          <xsl:when test="number(offset)">
                            <xsl:value-of select="number($tstampGestural) + number(offset)"/>
                          </xsl:when>
                          <!--<xsl:when test="number(ancestor::direction[1]/offset) and
                            not(ancestor::direction[1]/direction-type/dynamics/@default-x)">
                            <xsl:value-of select="number($tstampGestural) +
                              number(ancestor::direction[1]/offset)"/>
                          </xsl:when>-->
                          <xsl:otherwise>
                            <xsl:value-of select="number($tstampGestural)"/>
                          </xsl:otherwise>
                        </xsl:choose>
                      </xsl:with-param>
                    </xsl:call-template>
                  </xsl:attribute>
                  <xsl:if test="@spread">
                    <xsl:attribute name="opening">
                      <xsl:value-of select="format-number(@spread  div 5, '###0.########')"/>
                    </xsl:attribute>
                  </xsl:if>
                </xsl:for-each>
              </xsl:otherwise>
            </xsl:choose>
          </hairpin>
        </xsl:for-each>
        <xsl:for-each select="direction-type/words">
          <xsl:variable name="dirType">
            <xsl:choose>
              <xsl:when test="ancestor::direction[1]/sound[@tempo]">
                <xsl:text>tempo</xsl:text>
              </xsl:when>
              <xsl:otherwise>
                <xsl:text>dir</xsl:text>
              </xsl:otherwise>
            </xsl:choose>
          </xsl:variable>
          <xsl:element name="{$dirType}" namespace="http://www.music-encoding.org/ns/mei">
            <xsl:call-template name="dirBasicAttrs"/>
            <xsl:attribute name="place">
              <xsl:choose>
                <xsl:when test="ancestor::direction/@placement != ''">
                  <xsl:value-of select="ancestor::direction/@placement"/>
                </xsl:when>
                <xsl:otherwise>above</xsl:otherwise>
              </xsl:choose>
            </xsl:attribute>
            <xsl:call-template name="positionRelative"/>
            <xsl:if test="$dirType = 'tempo'">
              <xsl:attribute name="midi.tempo">
                <xsl:value-of select="ancestor::direction[1]/sound/@tempo"/>
              </xsl:attribute>
            </xsl:if>

            <!--<xsl:for-each
            select="../../following-sibling::*[1]/dashes[@type='start']">
            <xsl:attribute name="dur">
              <xsl:call-template name="getdurwords"/>
            </xsl:attribute>
          </xsl:for-each>-->

            <xsl:variable name="content">
              <xsl:value-of select="normalize-space(.)"/>
            </xsl:variable>
            <xsl:choose>
              <xsl:when test="@font-family | @font-style | @font-size | @font-weight |
                @letter-spacing                 | @line-height | @justify | @halign | @valign |
                @color | @rotation |                 @xml:space | @underline | @overline |
                @line-through | @dir | @enclosure">
                <xsl:call-template name="wrapRend">
                  <xsl:with-param name="in">
                    <xsl:copy-of select="$content"/>
                  </xsl:with-param>
                </xsl:call-template>
              </xsl:when>
              <xsl:otherwise>
                <xsl:copy-of select="$content"/>
              </xsl:otherwise>
            </xsl:choose>
          </xsl:element>
        </xsl:for-each>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template match="fermata" mode="stage1">
    <fermata xmlns="http://www.music-encoding.org/ns/mei">
      <xsl:attribute name="tstamp">
        <xsl:call-template name="tstamp.ges2beat">
          <xsl:with-param name="tstamp.ges">
            <xsl:for-each select="ancestor::note[1]">
              <xsl:call-template name="getTimestamp.ges"/>
            </xsl:for-each>
          </xsl:with-param>
        </xsl:call-template>
      </xsl:attribute>
      <xsl:attribute name="tstamp.ges">
        <xsl:for-each select="ancestor::note[1]">
          <xsl:call-template name="getTimestamp.ges"/>
        </xsl:for-each>
      </xsl:attribute>
      <xsl:for-each select="ancestor::note[1]">
        <xsl:variable name="partID">
          <xsl:value-of select="ancestor::part/@id"/>
        </xsl:variable>
        <xsl:variable name="partStaff">
          <xsl:choose>
            <xsl:when test="staff">
              <xsl:value-of select="staff"/>
            </xsl:when>
            <xsl:otherwise>1</xsl:otherwise>
          </xsl:choose>
        </xsl:variable>
        <xsl:attribute name="staff">
          <xsl:call-template name="getStaffNum">
            <xsl:with-param name="partID">
              <xsl:value-of select="$partID"/>
            </xsl:with-param>
            <xsl:with-param name="partStaff">
              <xsl:value-of select="$partStaff"/>
            </xsl:with-param>
          </xsl:call-template>
        </xsl:attribute>
        <xsl:attribute name="startid">
          <xsl:value-of select="generate-id()"/>
        </xsl:attribute>
      </xsl:for-each>
      <xsl:attribute name="place">
        <xsl:choose>
          <xsl:when test="@type='upright'">above</xsl:when>
          <xsl:when test="@type='inverted'">below</xsl:when>
          <xsl:otherwise>above</xsl:otherwise>
        </xsl:choose>
      </xsl:attribute>
      <xsl:call-template name="positionRelative"/>
      <xsl:attribute name="form">
        <xsl:choose>
          <xsl:when test="@type='inverted'">
            <xsl:text>inv</xsl:text>
          </xsl:when>
          <xsl:otherwise>
            <xsl:text>norm</xsl:text>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:attribute>
    </fermata>
  </xsl:template>

  <xsl:template match="forward" mode="stage1">
    <!-- Forward skips in time have to be filled with space in MEI when 
         they are followed by events; i.e., notes -->
    <xsl:if test="following-sibling::note">
      <xsl:variable name="thisPart">
        <xsl:value-of select="ancestor::part/@id"/>
      </xsl:variable>
      <xsl:variable name="ppq">
        <xsl:choose>
          <xsl:when test="ancestor::part[attributes/divisions]">
            <xsl:value-of select="ancestor::part[attributes/divisions]/attributes/divisions"/>
          </xsl:when>
          <xsl:when test="preceding::part[@id=$thisPart and attributes/divisions]">
            <xsl:value-of select="preceding::part[@id=$thisPart and
              attributes/divisions][1]/attributes/divisions"/>
          </xsl:when>
        </xsl:choose>
      </xsl:variable>
      <xsl:variable name="meterCount">
        <xsl:choose>
          <xsl:when test="ancestor::part[attributes/time/beats]/attributes/time/beats">
            <xsl:value-of select="ancestor::part[attributes/time/beats]/attributes/time/beats"/>
          </xsl:when>
          <xsl:when test="preceding::part[@id=$thisPart and attributes/time]">
            <xsl:value-of select="preceding::part[@id=$thisPart and
              attributes/time][1]/attributes/time/beats"/>
          </xsl:when>
          <xsl:otherwise>
            <xsl:value-of select="sum(ancestor::part/note/duration) div $ppq"/>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:variable>
      <xsl:variable name="meterUnit">
        <xsl:choose>
          <xsl:when test="ancestor::part[@id=$thisPart and
            attributes/time/beat-type]/attributes/time/beat-type">
            <xsl:value-of select="ancestor::part[@id=$thisPart and
              attributes/time/beat-type]/attributes/time/beat-type"/>
          </xsl:when>
          <xsl:when test="preceding::part[@id=$thisPart and attributes/time]">
            <xsl:value-of select="preceding::part[@id=$thisPart and
              attributes/time][1]/attributes/time/beat-type"/>
          </xsl:when>
          <xsl:otherwise>4</xsl:otherwise>
        </xsl:choose>
      </xsl:variable>
      <xsl:variable name="measureDuration">
        <xsl:call-template name="measureDuration">
          <xsl:with-param name="meterCount">
            <xsl:value-of select="$meterCount"/>
          </xsl:with-param>
          <xsl:with-param name="meterUnit">
            <xsl:value-of select="$meterUnit"/>
          </xsl:with-param>
          <xsl:with-param name="ppq">
            <xsl:value-of select="$ppq"/>
          </xsl:with-param>
        </xsl:call-template>
      </xsl:variable>
      <xsl:variable name="spaceType">
        <xsl:choose>
          <xsl:when test="duration = $measureDuration">
            <xsl:text>mSpace</xsl:text>
          </xsl:when>
          <xsl:otherwise>
            <xsl:text>space</xsl:text>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:variable>
      <xsl:element name="{$spaceType}" xmlns="http://www.music-encoding.org/ns/mei">
        <xsl:attribute name="xml:id">
          <xsl:value-of select="generate-id()"/>
        </xsl:attribute>
        <xsl:attribute name="tstamp.ges">
          <xsl:call-template name="getTimestamp.ges"/>
        </xsl:attribute>

        <!--<xsl:variable name="thisPart">
          <xsl:value-of select="ancestor::part/@id"/>
        </xsl:variable>
        <xsl:variable name="ppq">
          <xsl:choose>
            <xsl:when test="ancestor::part[attributes/divisions]">
              <xsl:value-of select="ancestor::part[attributes/divisions]/attributes/divisions"/>
            </xsl:when>
            <xsl:when test="preceding::part[@id=$thisPart and attributes/divisions]">
              <xsl:value-of select="preceding::part[@id=$thisPart and
                attributes/divisions][1]/attributes/divisions"/>
            </xsl:when>
          </xsl:choose>
        </xsl:variable>-->

        <!-- The duration of the space in musical terms isn't required for the conversion of 
          MusicXML to MEI, but it may be necessary if processing of the MEI file. -->
        <xsl:variable name="dur">
          <xsl:call-template name="quantizedDuration">
            <xsl:with-param name="duration">
              <xsl:value-of select="duration"/>
            </xsl:with-param>
            <xsl:with-param name="ppq">
              <xsl:value-of select="$ppq"/>
            </xsl:with-param>
          </xsl:call-template>
        </xsl:variable>
        <xsl:choose>
          <xsl:when test="matches($dur, '\.')">
            <xsl:attribute name="dur">
              <xsl:value-of select="substring-before($dur, '.')"/>
            </xsl:attribute>
            <xsl:attribute name="dots">
              <xsl:value-of select="string-length(substring-after($dur, substring-before($dur,
                '.')))"/>
            </xsl:attribute>
          </xsl:when>
          <xsl:otherwise>
            <xsl:attribute name="dur">
              <xsl:value-of select="$dur"/>
            </xsl:attribute>
          </xsl:otherwise>
        </xsl:choose>
        <xsl:call-template name="gesturalDuration"/>
        <xsl:call-template name="assignPart-Layer-Staff-Beam-Tuplet"/>
      </xsl:element>
    </xsl:if>
  </xsl:template>

  <xsl:template match="lyric" mode="stage1">
    <!-- Lyric sub-elements of note -->
    <verse xmlns="http://www.music-encoding.org/ns/mei">
      <xsl:attribute name="n">
        <xsl:choose>
          <xsl:when test="@number">
            <xsl:value-of select="@number"/>
          </xsl:when>
          <xsl:otherwise>1</xsl:otherwise>
        </xsl:choose>
      </xsl:attribute>

      <!-- Relative vertical placement attributes go on verse -->
      <xsl:if test="@relative-y">
        <xsl:attribute name="vo">
          <xsl:value-of select="format-number(@relative-y  div 5, '###0.########')"/>
          <!-- <xsl:text>vu</xsl:text> -->
        </xsl:attribute>
      </xsl:if>

      <xsl:for-each select="text">
        <syl>
          <xsl:choose>
            <xsl:when test="../syllabic='begin'">
              <xsl:attribute name="wordpos">i</xsl:attribute>
              <xsl:attribute name="con">d</xsl:attribute>
            </xsl:when>
            <xsl:when test="../syllabic='middle'">
              <xsl:attribute name="wordpos">m</xsl:attribute>
              <xsl:attribute name="con">d</xsl:attribute>
            </xsl:when>
            <xsl:when test="../syllabic='end'">
              <xsl:attribute name="wordpos">t</xsl:attribute>
              <xsl:if test="../extend">
                <xsl:attribute name="con">u</xsl:attribute>
              </xsl:if>
            </xsl:when>
            <xsl:when test="../syllabic='single'">
              <xsl:if test="../extend">
                <xsl:attribute name="con">u</xsl:attribute>
              </xsl:if>
            </xsl:when>
          </xsl:choose>

          <!-- Horizontal placement attributes go on syl -->
          <xsl:if test="../@default-x">
            <xsl:attribute name="x">
              <xsl:value-of select="format-number(../@default-x div 5, '###0.########')"/>
            </xsl:attribute>
          </xsl:if>
          <xsl:if test="../@relative-x">
            <xsl:attribute name="ho">
              <xsl:value-of select="format-number(../@relative-x div 5, '###0.########')"/>
              <!-- <xsl:text>vu</xsl:text> -->
            </xsl:attribute>
          </xsl:if>
          <xsl:if test="../@justify">
            <xsl:attribute name="halign">
              <xsl:value-of select="../@justify"/>
            </xsl:attribute>
          </xsl:if>
          <xsl:value-of select="."/>

          <!--<xsl:call-template name="fontproperties"/>-->
        </syl>
      </xsl:for-each>
      <xsl:if test="end-line">
        <lb/>
      </xsl:if>
      <xsl:if test="end-paragraph">
        <lb type="end-paragraph"/>
      </xsl:if>
    </verse>
  </xsl:template>

  <xsl:template match="measure" mode="measContent">
    <!-- Process each measure -->
    <!-- Page breaks and system breaks precede the measure. -->
    <xsl:if test="part[print/@new-page='yes']">
      <pb xmlns="http://www.music-encoding.org/ns/mei">
        <xsl:if test="normalize-space(part[print/@new-page='yes'][1]/print/@page-number) != ''">
          <xsl:attribute name="n">
            <xsl:value-of select="part[print/@new-page='yes'][1]/print/@page-number"/>
          </xsl:attribute>
        </xsl:if>
      </pb>
    </xsl:if>
    <xsl:if test="part[print/@new-system='yes']">
      <sb xmlns="http://www.music-encoding.org/ns/mei"/>
    </xsl:if>

    <xsl:if test="count(preceding::measure) &gt; 0">
      <!-- Ignore music and layout parameters in the first measure since these have already
        been placed in score/scoreDef -->

      <!-- Score-level info precedes the measure. -->
      <xsl:if test="part/attributes[not(preceding-sibling::note) and
        not(preceding-sibling::forward)][time or key] | part[print/page-layout or
        print/system-layout]">
        <scoreDef xmlns="http://www.music-encoding.org/ns/mei">
          <!-- Time signature -->
          <xsl:if test="part/attributes[1]/time">
            <xsl:attribute name="meter.count">
              <xsl:value-of select="part[attributes[1]/time/beats][1]/attributes/time/beats"/>
            </xsl:attribute>
            <xsl:attribute name="meter.unit">
              <xsl:value-of select="part[attributes[1]/time/beat-type][1]/attributes/time/beat-type"
              />
            </xsl:attribute>
            <xsl:choose>
              <xsl:when test="part/attributes[1]/time/@symbol='common'">
                <xsl:attribute name="meter.sym">common</xsl:attribute>
              </xsl:when>
              <xsl:when test="part/attributes[1]/time/@symbol='cut'">
                <xsl:attribute name="meter.sym">cut</xsl:attribute>
              </xsl:when>
              <xsl:when test="part/attributes[1]/time/@symbol='single-number'">
                <xsl:attribute name="meter.rend">denomsym</xsl:attribute>
              </xsl:when>
              <xsl:when test="part/attributes[1]/time/senza-misura">
                <xsl:attribute name="meter.rend">invis</xsl:attribute>
              </xsl:when>
            </xsl:choose>
          </xsl:if>

          <!-- Key signature -->
          <xsl:if test="part/attributes[not(preceding-sibling::note) and
            not(preceding-sibling::forward) and not(transpose)][key]">
            <xsl:variable name="keySig">
              <xsl:choose>
                <xsl:when test="count(distinct-values(part/attributes[not(preceding-sibling::note)
                  and not(preceding-sibling::forward) and
                  not(transpose)][key]/key/fifths)) &gt; 1">
                  <xsl:choose>
                    <xsl:when test="part/attributes[not(preceding-sibling::note)
                      and not(preceding-sibling::forward) and
                      not(transpose)][key[not(@number)]]">
                      <xsl:value-of select="number(part/attributes[not(preceding-sibling::note)
                        and not(preceding-sibling::forward) and
                        not(transpose)][key[not(@number)]]/key[not(@number)][1]/fifths)"/>
                    </xsl:when>
                    <xsl:otherwise>
                      <xsl:text/>
                    </xsl:otherwise>
                  </xsl:choose>
                </xsl:when>
                <xsl:otherwise>
                  <xsl:value-of select="part/attributes[not(preceding-sibling::note) and
                    not(preceding-sibling::forward) and not(transpose)][key]/key[1]/fifths"/>
                </xsl:otherwise>
              </xsl:choose>
            </xsl:variable>
            <!-- Key  mode -->
            <xsl:variable name="scoreMode">
              <xsl:value-of select="attributes[not(transpose) and key][1]/key[1]/mode"/>
            </xsl:variable>
            <xsl:choose>
              <xsl:when test="number($keySig)=0">
                <xsl:attribute name="key.sig">
                  <xsl:value-of select="$keySig"/>
                </xsl:attribute>
              </xsl:when>
              <xsl:when test="number($keySig) &gt; 0">
                <xsl:attribute name="key.sig"><xsl:value-of select="$keySig"/>s</xsl:attribute>
              </xsl:when>
              <xsl:when test="number($keySig) &lt; 0">
                <xsl:attribute name="key.sig">
                  <xsl:value-of select="abs(number($keySig))"/>f</xsl:attribute>
              </xsl:when>
            </xsl:choose>
            <xsl:if test="part/attributes[not(preceding-sibling::note) and
              not(preceding-sibling::forward) and not(transpose)][key/mode]">
              <xsl:attribute name="key.mode">
                <xsl:value-of select="part/attributes[not(preceding-sibling::note) and
                  not(preceding-sibling::forward) and not(transpose)][key]/key[1]/mode"/>
              </xsl:attribute>
            </xsl:if>
          </xsl:if>

          <!-- Page layout info -->
          <xsl:for-each select="part[print/page-layout][1]/print/page-layout">
            <xsl:for-each select="page-height">
              <xsl:attribute name="page.height">
                <xsl:value-of select="format-number(. div 5, '###0.########')"/>
                <!-- <xsl:text>vu</xsl:text> -->
              </xsl:attribute>
            </xsl:for-each>
            <xsl:for-each select="page-width">
              <xsl:attribute name="page.width">
                <xsl:value-of select="format-number(. div 5, '###0.########')"/>
                <!-- <xsl:text>vu</xsl:text> -->
              </xsl:attribute>
            </xsl:for-each>
            <xsl:for-each select="page-margins">
              <xsl:attribute name="page.leftmar">
                <xsl:value-of select="format-number(left-margin div 5, '###0.########')"/>
                <!-- <xsl:text>vu</xsl:text> -->
              </xsl:attribute>
              <xsl:attribute name="page.rightmar">
                <xsl:value-of select="format-number(right-margin div 5, '###0.########')"/>
                <!-- <xsl:text>vu</xsl:text> -->
              </xsl:attribute>
              <xsl:attribute name="page.topmar">
                <xsl:value-of select="format-number(top-margin div 5, '###0.########')"/>
                <!-- <xsl:text>vu</xsl:text> -->
              </xsl:attribute>
              <xsl:attribute name="page.botmar">
                <xsl:value-of select="format-number(bottom-margin div 5, '###0.########')"/>
                <!-- <xsl:text>vu</xsl:text> -->
              </xsl:attribute>
            </xsl:for-each>
          </xsl:for-each>
          <!-- System layout info -->
          <xsl:for-each select="part[print/system-layout][1]/print/system-layout">
            <xsl:for-each select="system-margins">
              <xsl:attribute name="system.leftmar">
                <xsl:value-of select="format-number(left-margin div 5, '###0.########')"/>
                <!-- <xsl:text>vu</xsl:text> -->
              </xsl:attribute>
              <xsl:attribute name="system.rightmar">
                <xsl:value-of select="format-number(right-margin div 5, '###0.########')"/>
                <!-- <xsl:text>vu</xsl:text> -->
              </xsl:attribute>
            </xsl:for-each>
            <xsl:for-each select="system-distance">
              <xsl:attribute name="spacing.system">
                <xsl:value-of select="format-number(. div 5, '###0.########')"/>
                <!-- <xsl:text>vu</xsl:text> -->
              </xsl:attribute>
            </xsl:for-each>
            <xsl:for-each select="top-system-distance">
              <xsl:attribute name="system.topmar">
                <xsl:value-of select="format-number(. div 5, '###0.########')"/>
                <!-- <xsl:text>vu</xsl:text> -->
              </xsl:attribute>
            </xsl:for-each>
          </xsl:for-each>
        </scoreDef>
      </xsl:if>

      <!-- Staff-level info -->
      <xsl:for-each select="part[attributes[not(preceding-sibling::note) and
        not(preceding-sibling::forward)][clef or divisions or key or staff-details[*] or
        transpose] or print[*]]">
        <!-- ID of this part -->
        <xsl:variable name="partID">
          <xsl:value-of select="@id"/>
        </xsl:variable>

        <!-- Concert key -->
        <xsl:variable name="scoreFifths">
          <xsl:choose>
            <!-- Concert key given in the current measure -->
            <xsl:when test="attributes[not(transpose) and key][1]/key">
              <xsl:value-of select="attributes[not(transpose) and
                key][1]/key[1]/fifths"/>
            </xsl:when>
            <xsl:otherwise>
              <!-- Concert key provided in a prior measure -->
              <xsl:value-of select="preceding::part[attributes[not(transpose) and
                key]][1]/attributes/key[1]/fifths"/>
            </xsl:otherwise>
          </xsl:choose>
        </xsl:variable>
        <!-- Mode of concert key -->
        <xsl:variable name="scoreMode">
          <xsl:choose>
            <!-- Concert key mode given in the current measure -->
            <xsl:when test="attributes[not(transpose) and key][1]/key">
              <xsl:value-of select="attributes[not(transpose) and key][1]/key[1]/mode"/>
            </xsl:when>
            <xsl:otherwise>
              <!-- Concert key provided in a prior measure -->
              <xsl:value-of select="preceding::part[attributes[not(transpose) and
                key]][1]/attributes/key[1]/mode"/>
            </xsl:otherwise>
          </xsl:choose>
        </xsl:variable>

        <xsl:choose>
          <xsl:when test="local-name($defaultLayout//*[@xml:id=$partID]) = 'staffDef'">
            <!-- Part has only 1 staff -->
            <!-- Gather staff qualities -->
            <xsl:variable name="staffAttrib">
              <xsl:copy-of select="print/staff-layout"/>
              <xsl:copy-of select="attributes/clef"/>
              <xsl:copy-of select="attributes/divisions"/>
              <xsl:copy-of select="attributes/key"/>
              <xsl:copy-of select="attributes/staff-details"/>
              <xsl:copy-of select="attributes/transpose"/>
            </xsl:variable>

            <!--<xsl:value-of select="$nl"/>
              <xsl:comment>StaffAttrib <xsl:value-of select="$partID"/></xsl:comment>
              <xsl:value-of select="$nl"/>
              <xsl:copy-of select="$staffAttrib"/>-->

            <xsl:variable name="staffDefTemp">
              <!-- Gather staff-specific qualities -->
              <xsl:for-each select="$defaultLayout//*[@xml:id=$partID]">
                <staffDef>
                  <xsl:variable name="thisStaff">
                    <xsl:value-of select="position()"/>
                  </xsl:variable>
                  <xsl:copy-of select="@n"/>
                  <xsl:copy-of select="$staffAttrib/*[number(@number) = $thisStaff]"/>
                  <xsl:copy-of select="$staffAttrib/clef[not(@number)][1]"/>
                  <xsl:copy-of select="$staffAttrib/divisions"/>
                  <xsl:copy-of select="$staffAttrib/key[not(@number)][1]"/>
                  <xsl:copy-of select="$staffAttrib/staff-details[not(@number)][1]"/>
                  <xsl:copy-of select="$staffAttrib/staff-layout[not(@number)][1]"/>
                  <xsl:copy-of select="$staffAttrib/transpose[not(@number)][1]"/>
                </staffDef>
              </xsl:for-each>
            </xsl:variable>

            <!--<xsl:value-of select="$nl"/>
              <xsl:comment>StaffDefTemp <xsl:value-of select="$partID"/></xsl:comment>
              <xsl:value-of select="$nl"/>
              <xsl:copy-of select="$staffDefTemp"/>-->

            <!-- Process staff-specific qualities -->
            <xsl:for-each select="$staffDefTemp/staffDef[*]">
              <staffDef xmlns="http://www.music-encoding.org/ns/mei">
                <xsl:copy-of select="@n"/>
                <!-- number of staff lines -->
                <xsl:for-each select="staff-details/staff-lines">
                  <xsl:attribute name="lines">
                    <xsl:value-of select="."/>
                  </xsl:attribute>
                </xsl:for-each>
                <!-- clef -->
                <xsl:for-each select="clef">
                  <xsl:choose>
                    <!-- percussion clef -->
                    <xsl:when test="sign='percussion'">
                      <xsl:attribute name="clef.shape">perc</xsl:attribute>
                    </xsl:when>
                    <!-- TAB "clef" -->
                    <xsl:when test="sign='TAB'">
                      <xsl:attribute name="clef.shape">TAB</xsl:attribute>
                    </xsl:when>
                    <!-- "normal" clef -->
                    <xsl:otherwise>
                      <xsl:attribute name="clef.line">
                        <xsl:value-of select="line"/>
                      </xsl:attribute>
                      <xsl:attribute name="clef.shape">
                        <xsl:value-of select="sign"/>
                      </xsl:attribute>
                      <xsl:if test="clef-octave-change">
                        <xsl:if test="abs(number(clef-octave-change)) != 0">
                          <xsl:attribute name="clef.trans">
                            <xsl:choose>
                              <xsl:when test="number(clef-octave-change) &gt;= 2">15va</xsl:when>
                              <xsl:when test="number(clef-octave-change) = 1">8va</xsl:when>
                              <xsl:when test="number(clef-octave-change) = -1">8vb</xsl:when>
                              <xsl:when test="number(clef-octave-change) &lt;= -2">15vb</xsl:when>
                              <xsl:otherwise>8va</xsl:otherwise>
                            </xsl:choose>
                          </xsl:attribute>
                        </xsl:if>
                      </xsl:if>
                    </xsl:otherwise>
                  </xsl:choose>
                  <xsl:if test="@print-object='no'">
                    <xsl:attribute name="clef.visible">false</xsl:attribute>
                  </xsl:if>
                </xsl:for-each>
                <!-- staff key signature -->
                <xsl:if test="key">
                  <xsl:variable name="keySig">
                    <xsl:value-of select="key/fifths"/>
                  </xsl:variable>
                  <!-- <xsl:if test="$keySig != $scoreFifths">-->
                  <xsl:choose>
                    <xsl:when test="number($keySig)=0">
                      <xsl:attribute name="key.sig">
                        <xsl:value-of select="$keySig"/>
                      </xsl:attribute>
                    </xsl:when>
                    <xsl:when test="number($keySig) &gt; 0">
                      <xsl:attribute name="key.sig"><xsl:value-of select="$keySig"
                        />s</xsl:attribute>
                    </xsl:when>
                    <xsl:when test="number($keySig) &lt; 0">
                      <xsl:attribute name="key.sig"><xsl:value-of select="abs($keySig)"
                        />f</xsl:attribute>
                    </xsl:when>
                  </xsl:choose>
                  <!-- staff key mode -->
                  <xsl:if test="key/mode and key/mode != $scoreMode">
                    <xsl:attribute name="key.mode">
                      <xsl:value-of select="key/mode"/>
                    </xsl:attribute>
                  </xsl:if>
                  <xsl:if test="key/@print-object='no'">
                    <xsl:attribute name="key.sig.show">false</xsl:attribute>
                  </xsl:if>
                </xsl:if>
                <!--</xsl:if>-->
                <!-- tuning for TAB staff -->
                <xsl:if test="staff-details/staff-tuning">
                  <xsl:attribute name="tab.strings">
                    <xsl:variable name="tabStrings">
                      <xsl:for-each select="staff-details/staff-tuning">
                        <xsl:sort select="@line" order="descending"/>
                        <xsl:variable name="thisString">
                          <xsl:value-of select="tuning-step"/>
                        </xsl:variable>
                        <xsl:value-of select="translate(tuning-step,'ABCDEFG','abcdefg')"/>
                        <xsl:value-of select="tuning-octave"/>
                        <xsl:text>&#32;</xsl:text>
                      </xsl:for-each>
                    </xsl:variable>
                    <xsl:value-of select="normalize-space($tabStrings)"/>
                  </xsl:attribute>
                </xsl:if>
                <!-- staff transposition -->
                <xsl:choose>
                  <!-- transposed -->
                  <xsl:when test="transpose">
                    <xsl:attribute name="trans.semi">
                      <xsl:choose>
                        <xsl:when test="transpose/octave-change">
                          <xsl:variable name="octaveChange">
                            <xsl:value-of select="transpose[1]/octave-change"/>
                          </xsl:variable>
                          <xsl:variable name="chromatic">
                            <xsl:value-of select="transpose[1]/chromatic"/>
                          </xsl:variable>
                          <xsl:value-of select="$chromatic + (12 * $octaveChange)"/>
                        </xsl:when>
                        <xsl:otherwise>
                          <xsl:value-of select="transpose[1]/chromatic"/>
                        </xsl:otherwise>
                      </xsl:choose>
                    </xsl:attribute>
                    <xsl:if test="transpose/diatonic">
                      <xsl:attribute name="trans.diat">
                        <xsl:value-of select="transpose[1]/diatonic"/>
                      </xsl:attribute>
                    </xsl:if>
                  </xsl:when>
                  <!-- transposed by capo -->
                  <xsl:when test="staff-details/capo">
                    <xsl:attribute name="trans.semi">
                      <xsl:value-of select="staff-details[capo]/capo"/>
                    </xsl:attribute>
                  </xsl:when>
                </xsl:choose>
                <!-- ppq -->
                <xsl:for-each select="divisions">
                  <xsl:if test="number(.) != $scorePPQ">
                    <xsl:attribute name="ppq">
                      <xsl:value-of select="."/>
                    </xsl:attribute>
                  </xsl:if>
                </xsl:for-each>
                <!-- staff spacing -->
                <xsl:for-each select="staff-layout/staff-distance">
                  <xsl:attribute name="spacing">
                    <xsl:value-of select="format-number(. div 5, '###0.########')"/>
                    <!-- <xsl:text>vu</xsl:text> -->
                  </xsl:attribute>
                </xsl:for-each>
                <!-- staff size -->
                <xsl:for-each select="staff-details/staff-size">
                  <xsl:attribute name="scale">
                    <xsl:value-of select="."/>
                    <xsl:text>%</xsl:text>
                  </xsl:attribute>
                </xsl:for-each>
                <xsl:if test="staff-details/@print-object">
                  <xsl:attribute name="visible">
                    <xsl:choose>
                      <xsl:when test="staff-details/@print-object='no'">
                        <xsl:text>false</xsl:text>
                      </xsl:when>
                      <xsl:otherwise>
                        <xsl:text>true</xsl:text>
                      </xsl:otherwise>
                    </xsl:choose>
                  </xsl:attribute>
                </xsl:if>
              </staffDef>
            </xsl:for-each>
          </xsl:when>
          <xsl:when test="local-name($defaultLayout//*[@xml:id=$partID]) = 'staffGrp'">
            <!-- Part has multiple staves -->
            <!--  Gather staff qualities -->
            <xsl:variable name="staffAttrib">
              <xsl:copy-of select="print/staff-layout"/>
              <xsl:copy-of select="attributes/clef"/>
              <xsl:copy-of select="attributes/divisions"/>
              <xsl:copy-of select="attributes/key"/>
              <xsl:copy-of select="attributes/staff-details"/>
              <xsl:copy-of select="attributes/transpose"/>
            </xsl:variable>

            <!--<xsl:value-of select="$nl"/>
              <xsl:comment>StaffAttrib <xsl:value-of select="$partID"/></xsl:comment>
              <xsl:value-of select="$nl"/>
              <xsl:copy-of select="$staffAttrib"/>-->

            <!-- Gather staff-specific qualities -->
            <xsl:variable name="staffDefTemp">
              <xsl:for-each select="$defaultLayout//*[@xml:id=$partID]/*[local-name()='staffDef']">
                <staffDef>
                  <xsl:variable name="thisStaff">
                    <xsl:value-of select="position()"/>
                  </xsl:variable>
                  <xsl:copy-of select="@n"/>
                  <xsl:copy-of select="$staffAttrib/*[number(@number) = $thisStaff]"/>
                  <xsl:if test="not($staffAttrib/clef[number(@number) = $thisStaff])">
                    <xsl:copy-of select="$staffAttrib/clef[not(@number)][1]"/>
                  </xsl:if>
                  <xsl:if test="not($staffAttrib/key[number(@number) = $thisStaff])">
                    <xsl:copy-of select="$staffAttrib/key[not(@number)][1]"/>
                  </xsl:if>
                  <xsl:if test="not($staffAttrib/staff-details[number(@number) = $thisStaff])">
                    <xsl:copy-of select="$staffAttrib/staff-details[not(@number)][1]"/>
                  </xsl:if>
                  <xsl:if test="not($staffAttrib/staff-layout[number(@number) = $thisStaff])">
                    <xsl:copy-of select="$staffAttrib/staff-layout[not(@number)][1]"/>
                  </xsl:if>
                  <xsl:if test="not($staffAttrib/transpose[number(@number) = $thisStaff])">
                    <xsl:copy-of select="$staffAttrib/transpose[not(@number)][1]"/>
                  </xsl:if>
                  <xsl:copy-of select="$staffAttrib/divisions"/>
                </staffDef>
              </xsl:for-each>
            </xsl:variable>

            <!-- <xsl:value-of select="$nl"/>
              <xsl:comment>StaffDefTemp <xsl:value-of select="$partID"/></xsl:comment>
              <xsl:value-of select="$nl"/>
              <xsl:copy-of select="$staffDefTemp"/>-->

            <!-- Process staff-specific qualities -->
            <xsl:for-each select="$staffDefTemp/staffDef[*]">
              <staffDef xmlns="http://www.music-encoding.org/ns/mei">
                <xsl:copy-of select="@n"/>
                <!-- number of staff lines -->
                <xsl:for-each select="staff-details/staff-lines">
                  <xsl:attribute name="lines">
                    <xsl:value-of select="."/>
                  </xsl:attribute>
                </xsl:for-each>
                <!-- clef -->
                <xsl:for-each select="clef">
                  <xsl:choose>
                    <!-- percussion clef -->
                    <xsl:when test="sign='percussion'">
                      <xsl:attribute name="clef.shape">perc</xsl:attribute>
                    </xsl:when>
                    <!-- TAB "clef" -->
                    <xsl:when test="sign='TAB'">
                      <xsl:attribute name="clef.shape">TAB</xsl:attribute>
                    </xsl:when>
                    <!-- "normal" clef -->
                    <xsl:otherwise>
                      <xsl:attribute name="clef.line">
                        <xsl:value-of select="line"/>
                      </xsl:attribute>
                      <xsl:attribute name="clef.shape">
                        <xsl:value-of select="sign"/>
                      </xsl:attribute>
                      <xsl:if test="clef-octave-change">
                        <xsl:if test="abs(number(clef-octave-change)) != 0">
                          <xsl:attribute name="clef.trans">
                            <xsl:choose>
                              <xsl:when test="number(clef-octave-change) &gt;= 2">15va</xsl:when>
                              <xsl:when test="number(clef-octave-change) = 1">8va</xsl:when>
                              <xsl:when test="number(clef-octave-change) = -1">8vb</xsl:when>
                              <xsl:when test="number(clef-octave-change) &lt;= -2">15vb</xsl:when>
                              <xsl:otherwise>8va</xsl:otherwise>
                            </xsl:choose>
                          </xsl:attribute>
                        </xsl:if>
                      </xsl:if>
                    </xsl:otherwise>
                  </xsl:choose>
                  <xsl:if test="@print-object='no'">
                    <xsl:attribute name="clef.visible">false</xsl:attribute>
                  </xsl:if>
                </xsl:for-each>
                <!-- staff key signature -->
                <xsl:if test="key">
                  <xsl:variable name="keySig">
                    <xsl:value-of select="key/fifths"/>
                  </xsl:variable>
                  <!-- <xsl:if test="$keySig != $scoreFifths">-->
                  <xsl:choose>
                    <xsl:when test="number($keySig)=0">
                      <xsl:attribute name="key.sig">
                        <xsl:value-of select="$keySig"/>
                      </xsl:attribute>
                    </xsl:when>
                    <xsl:when test="number($keySig) &gt; 0">
                      <xsl:attribute name="key.sig"><xsl:value-of select="$keySig"
                        />s</xsl:attribute>
                    </xsl:when>
                    <xsl:when test="number($keySig) &lt; 0">
                      <xsl:attribute name="key.sig"><xsl:value-of select="abs($keySig)"
                        />f</xsl:attribute>
                    </xsl:when>
                  </xsl:choose>
                  <!-- staff key mode -->
                  <xsl:if test="key/mode and key/mode != $scoreMode">
                    <xsl:attribute name="key.mode">
                      <xsl:value-of select="key/mode"/>
                    </xsl:attribute>
                  </xsl:if>
                  <xsl:if test="key/@print-object='no'">
                    <xsl:attribute name="key.sig.show">false</xsl:attribute>
                  </xsl:if>
                </xsl:if>
                <!--</xsl:if>-->
                <!-- tuning for TAB staff -->
                <xsl:if test="staff-details/staff-tuning">
                  <xsl:attribute name="tab.strings">
                    <xsl:variable name="tabStrings">
                      <xsl:for-each select="staff-details/staff-tuning">
                        <xsl:sort select="@line" order="descending"/>
                        <xsl:variable name="thisString">
                          <xsl:value-of select="tuning-step"/>
                        </xsl:variable>
                        <xsl:value-of select="translate(tuning-step,'ABCDEFG','abcdefg')"/>
                        <xsl:value-of select="tuning-octave"/>
                        <xsl:text>&#32;</xsl:text>
                      </xsl:for-each>
                    </xsl:variable>
                    <xsl:value-of select="normalize-space($tabStrings)"/>
                  </xsl:attribute>
                </xsl:if>
                <!-- staff transposition -->
                <xsl:choose>
                  <!-- transposed -->
                  <xsl:when test="transpose">
                    <xsl:attribute name="trans.semi">
                      <xsl:choose>
                        <xsl:when test="transpose/octave-change">
                          <xsl:variable name="octaveChange">
                            <xsl:value-of select="transpose[1]/octave-change"/>
                          </xsl:variable>
                          <xsl:variable name="chromatic">
                            <xsl:value-of select="transpose[1]/chromatic"/>
                          </xsl:variable>
                          <xsl:value-of select="$chromatic + (12 * $octaveChange)"/>
                        </xsl:when>
                        <xsl:otherwise>
                          <xsl:value-of select="transpose[1]/chromatic"/>
                        </xsl:otherwise>
                      </xsl:choose>
                    </xsl:attribute>
                    <xsl:if test="transpose/diatonic">
                      <xsl:attribute name="trans.diat">
                        <xsl:value-of select="transpose[1]/diatonic"/>
                      </xsl:attribute>
                    </xsl:if>
                  </xsl:when>
                  <!-- transposed by capo -->
                  <xsl:when test="staff-details/capo">
                    <xsl:attribute name="trans.semi">
                      <xsl:value-of select="staff-details[capo]/capo"/>
                    </xsl:attribute>
                  </xsl:when>
                </xsl:choose>
                <!-- ppq -->
                <xsl:for-each select="divisions">
                  <xsl:if test="number(.) != $scorePPQ">
                    <xsl:attribute name="ppq">
                      <xsl:value-of select="."/>
                    </xsl:attribute>
                  </xsl:if>
                </xsl:for-each>
                <!-- staff spacing -->
                <xsl:for-each select="staff-layout/staff-distance">
                  <xsl:attribute name="spacing">
                    <xsl:value-of select="format-number(. div 5, '###0.########')"/>
                    <!-- <xsl:text>vu</xsl:text> -->
                  </xsl:attribute>
                </xsl:for-each>
                <!-- staff size -->
                <xsl:for-each select="staff-details/staff-size">
                  <xsl:attribute name="scale">
                    <xsl:value-of select="."/>
                    <xsl:text>%</xsl:text>
                  </xsl:attribute>
                </xsl:for-each>
                <xsl:if test="staff-details/@print-object">
                  <xsl:attribute name="visible">
                    <xsl:choose>
                      <xsl:when test="staff-details/@print-object='no'">
                        <xsl:text>false</xsl:text>
                      </xsl:when>
                      <xsl:otherwise>
                        <xsl:text>true</xsl:text>
                      </xsl:otherwise>
                    </xsl:choose>
                  </xsl:attribute>
                </xsl:if>
              </staffDef>
            </xsl:for-each>
          </xsl:when>
        </xsl:choose>
      </xsl:for-each>
    </xsl:if>

    <xsl:variable name="measure">
      <measure xmlns="http://www.music-encoding.org/ns/mei">
        <!-- number -->
        <xsl:attribute name="n">
          <xsl:value-of select="@number"/>
        </xsl:attribute>
        <!-- metrical conformance -->
        <xsl:if test="@implicit='yes'">
          <xsl:attribute name="metcon">i</xsl:attribute>
        </xsl:if>
        <!-- generated ID -->
        <xsl:attribute name="xml:id">
          <xsl:value-of select="generate-id()"/>
        </xsl:attribute>
        <xsl:choose>
          <!-- When the *following measure* has its left barline attribute set, make that the right
            attribute on *this* measure -->
          <xsl:when test="following-sibling::measure[1]/part/barline[@location='left']/bar-style">
            <xsl:variable name="barStyle">
              <xsl:value-of select="following-sibling::measure[1]/part[1]/barline/bar-style"/>
            </xsl:variable>
            <xsl:choose>
              <xsl:when test="$barStyle='dotted'">
                <xsl:attribute name="right">dotted</xsl:attribute>
              </xsl:when>
              <xsl:when test="$barStyle='dashed'">
                <xsl:attribute name="right">dashed</xsl:attribute>
              </xsl:when>
              <xsl:when test="$barStyle='light-light'">
                <xsl:attribute name="right">dbl</xsl:attribute>
              </xsl:when>
              <xsl:when test="$barStyle='heavy-light'">
                <xsl:choose>
                  <xsl:when
                    test="following-sibling::measure[1]/part/barline/repeat/@direction='forward'">
                    <xsl:choose>
                      <xsl:when test="part/barline/repeat/@direction='backward'">
                        <xsl:attribute name="right">rptboth</xsl:attribute>
                      </xsl:when>
                      <xsl:otherwise>
                        <xsl:attribute name="right">rptstart</xsl:attribute>
                      </xsl:otherwise>
                    </xsl:choose>
                  </xsl:when>
                  <xsl:otherwise>
                    <xsl:attribute name="right">dbl</xsl:attribute>
                  </xsl:otherwise>
                </xsl:choose>
              </xsl:when>
              <xsl:when test="$barStyle='light-heavy'">
                <xsl:choose>
                  <xsl:when test="part/barline/repeat/@direction='backward'">
                    <xsl:attribute name="right">rptend</xsl:attribute>
                  </xsl:when>
                  <xsl:otherwise>
                    <xsl:attribute name="right">end</xsl:attribute>
                  </xsl:otherwise>
                </xsl:choose>
              </xsl:when>
              <xsl:when test="$barStyle='heavy-heavy'">
                <xsl:choose>
                  <xsl:when test="part/barline/repeat/@direction='backward' and
                    following-sibling::measure[1]/part/barline/repeat/@direction='forward'">
                    <xsl:attribute name="right">rptboth</xsl:attribute>
                  </xsl:when>
                  <xsl:otherwise>
                    <xsl:attribute name="right">dbl</xsl:attribute>
                  </xsl:otherwise>
                </xsl:choose>
              </xsl:when>
              <xsl:when test="$barStyle='none'">
                <xsl:attribute name="right">invis</xsl:attribute>
              </xsl:when>
            </xsl:choose>
          </xsl:when>
          <!-- Set this measure's right attribute when the *following measure* doesn't have a left
            barline specified,  -->
          <xsl:when test="part/barline[@location='right']/bar-style">
            <xsl:variable name="barStyle">
              <xsl:value-of select="part[1]/barline/bar-style"/>
            </xsl:variable>
            <xsl:choose>
              <xsl:when test="$barStyle='dotted'">
                <xsl:attribute name="right">dotted</xsl:attribute>
              </xsl:when>
              <xsl:when test="$barStyle='dashed'">
                <xsl:attribute name="right">dashed</xsl:attribute>
              </xsl:when>
              <xsl:when test="$barStyle='light-light'">
                <xsl:attribute name="right">dbl</xsl:attribute>
              </xsl:when>
              <xsl:when test="$barStyle='light-heavy'">
                <xsl:choose>
                  <xsl:when test="part/barline/repeat/@direction='backward'">
                    <xsl:choose>
                      <xsl:when
                        test="following-sibling::measure[1]/part/barline/repeat/@direction='forward'">
                        <xsl:attribute name="right">rptboth</xsl:attribute>
                      </xsl:when>
                      <xsl:otherwise>
                        <xsl:attribute name="right">rptend</xsl:attribute>
                      </xsl:otherwise>
                    </xsl:choose>
                  </xsl:when>
                  <xsl:otherwise>
                    <xsl:attribute name="right">end</xsl:attribute>
                  </xsl:otherwise>
                </xsl:choose>
              </xsl:when>
              <xsl:when test="$barStyle='heavy-light'">
                <xsl:choose>
                  <xsl:when
                    test="following-sibling::measure[1]/part/barline/repeat[@direction='forward']">
                    <xsl:attribute name="right">rptstart</xsl:attribute>
                  </xsl:when>
                  <xsl:otherwise>
                    <xsl:attribute name="right">dbl</xsl:attribute>
                  </xsl:otherwise>
                </xsl:choose>
              </xsl:when>
              <xsl:when test="$barStyle='heavy-heavy'">
                <xsl:choose>
                  <xsl:when test="part/barline/repeat[@direction='backward'] and
                    following-sibling::measure[1]/part/barline/repeat[@direction='forward']">
                    <xsl:attribute name="right">rptboth</xsl:attribute>
                  </xsl:when>
                  <xsl:otherwise>
                    <xsl:attribute name="right">dbl</xsl:attribute>
                  </xsl:otherwise>
                </xsl:choose>
              </xsl:when>
              <xsl:when test="$barStyle='none'">
                <xsl:attribute name="right">invis</xsl:attribute>
              </xsl:when>
            </xsl:choose>
          </xsl:when>
          <!-- This stylesheet doesn't handle a barline in the middle of a measure -->
        </xsl:choose>

        <!-- Set left attribute -->
        <xsl:if test="part/barline[@location='left']/bar-style">
          <xsl:variable name="lbarStyle">
            <xsl:value-of select="part/barline/bar-style"/>
          </xsl:variable>
          <xsl:choose>
            <xsl:when test="$lbarStyle='dotted'">
              <xsl:attribute name="left">dotted</xsl:attribute>
            </xsl:when>
            <xsl:when test="$lbarStyle='dashed'">
              <xsl:attribute name="left">dashed</xsl:attribute>
            </xsl:when>
            <xsl:when test="$lbarStyle='light-light'">
              <xsl:attribute name="left">dbl</xsl:attribute>
            </xsl:when>
            <xsl:when test="$lbarStyle='light-heavy'">
              <xsl:choose>
                <xsl:when test="part/barline/repeat/@direction='backward'">
                  <xsl:choose>
                    <xsl:when
                      test="preceding-sibling::measure[1]/part/barline/repeat/@direction='backward'">
                      <xsl:attribute name="left">rptend</xsl:attribute>
                    </xsl:when>
                    <xsl:otherwise>
                      <xsl:attribute name="left">end</xsl:attribute>
                    </xsl:otherwise>
                  </xsl:choose>
                </xsl:when>
                <xsl:otherwise>
                  <xsl:attribute name="right">end</xsl:attribute>
                </xsl:otherwise>
              </xsl:choose>
            </xsl:when>
            <xsl:when test="$lbarStyle='heavy-light'">
              <xsl:choose>
                <xsl:when test="part/barline/repeat/@direction='forward'">
                  <xsl:attribute name="left">rptstart</xsl:attribute>
                </xsl:when>
                <xsl:otherwise>
                  <xsl:attribute name="left">dbl</xsl:attribute>
                </xsl:otherwise>
              </xsl:choose>
            </xsl:when>
            <xsl:when test="$lbarStyle='heavy-heavy'">
              <xsl:choose>
                <xsl:when test="part/barline/repeat/@direction='forward' and
                  preceding-sibling::measure[1]/part/barline/repeat/@direction='backward'">
                  <xsl:attribute name="left">rptboth</xsl:attribute>
                </xsl:when>
                <xsl:otherwise>
                  <xsl:attribute name="left">dbl</xsl:attribute>
                </xsl:otherwise>
              </xsl:choose>
            </xsl:when>
            <xsl:when test="$lbarStyle='none'">
              <xsl:attribute name="left">invis</xsl:attribute>
            </xsl:when>
          </xsl:choose>
        </xsl:if>

        <!-- Set left attribute if bar-style is not present -->
        <xsl:if test="part/barline[@location='left'][repeat]">
          <xsl:choose>
            <xsl:when test="part/barline/repeat/@direction='forward'">
              <xsl:attribute name="left">rptstart</xsl:attribute>
            </xsl:when>
            <xsl:when test="part/barline/repeat/@direction='forward' and
              preceding-sibling::measure[1]/part/barline/repeat/@direction='backward'">
              <xsl:attribute name="left">rptboth</xsl:attribute>
            </xsl:when>
          </xsl:choose>
        </xsl:if>

        <!-- Set right attribute -->
        <xsl:if test="part/barline[@location='right'][repeat]">
          <xsl:choose>
            <xsl:when test="part/barline/repeat/@direction='backward'">
              <xsl:attribute name="right">rptend</xsl:attribute>
            </xsl:when>
            <xsl:when test="part/barline/repeat/@direction='backward' and
              following-sibling::measure[1]/part/barline/repeat/@direction='forward'">
              <xsl:attribute name="right">rptboth</xsl:attribute>
            </xsl:when>
          </xsl:choose>
        </xsl:if>

        <!-- Copy the measure width -->
        <xsl:if test="@width">
          <xsl:attribute name="width">
            <xsl:value-of select="format-number(@width div 5, '###0.########')"/>
            <!-- <xsl:text>vu</xsl:text> -->
          </xsl:attribute>
        </xsl:if>
        <xsl:value-of select="$nl"/>

        <!-- Process measure contents -->
        <xsl:for-each select="part">
          <!-- Events -->
          <xsl:for-each-group select="note[not(chord)] | attributes | backup | forward"
            group-ending-with="backup">
            <xsl:apply-templates select="current-group()" mode="stage1"/>
          </xsl:for-each-group>
        </xsl:for-each>

        <xsl:for-each select="part">
          <!-- Control events -->
          <xsl:variable name="controlevents">
            <!--<xsl:apply-templates select="note/notations/articulations/caesura" mode="stage1"/>-->
            <xsl:apply-templates select="note/notations/dynamics" mode="stage1"/>
            <xsl:apply-templates select="direction" mode="stage1"/>
            <!-- <xsl:apply-templates select="note/notations/tuplet[@type='start']" mode="stage1"/>
            <xsl:apply-templates select="note/notations/slur[@type='start' or @type='continue']"
              mode="stage1"/>
            <xsl:apply-templates select="note/notations/tied[@type='start']" mode="stage1"/>-->
            <xsl:apply-templates select="note/notations/fermata" mode="stage1"/>
            <!--<xsl:apply-templates select="note/notations/ornaments" mode="stage1"/>
            <xsl:apply-templates select="note[not(chord) and notations/arpeggiate]" mode="arpeg"/>
            <xsl:apply-templates select="harmony" mode="stage1"/>
            <xsl:apply-templates select="note/notations/technical/pull-off[@type='start']"
              mode="stage1"/>-->
          </xsl:variable>
          <xsl:for-each select="$controlevents/*">
            <!-- For ease of reading, sort the control events on the tstamp.ges attribute. -->
            <xsl:sort select="@tstamp.ges" data-type="number"/>
            <xsl:copy-of select="."/>
          </xsl:for-each>
        </xsl:for-each>
        <xsl:value-of select="$nl"/>
      </measure>
    </xsl:variable>
    <!--<xsl:copy-of select="$measure"/>-->

    <!-- Further process $measure -->
    <xsl:for-each select="$measure/mei:measure">
      <measure xmlns="http://www.music-encoding.org/ns/mei">
        <xsl:copy-of select="@*"/>
        <xsl:variable name="measureNum">
          <xsl:value-of select="@n"/>
        </xsl:variable>
        <xsl:for-each-group
          select="mei:chord|mei:clef|mei:note|mei:rest|mei:space|mei:mRest|mei:mSpace"
          group-by="@part">
          <xsl:variable name="byPart">
            <part>
              <xsl:attribute name="n">
                <xsl:value-of select="current-grouping-key()"/>
              </xsl:attribute>
              <xsl:for-each-group select="current-group()" group-by="@layer">
                <layer>
                  <xsl:attribute name="n">
                    <xsl:value-of select="current-grouping-key()"/>
                  </xsl:attribute>
                  <xsl:copy-of select="current-group()"/>
                </layer>
              </xsl:for-each-group>
            </part>
          </xsl:variable>
          <!--<xsl:copy-of select="$byPart"/>-->

          <xsl:variable name="byStaff">
            <xsl:for-each select="$byPart/mei:part">
              <xsl:for-each select="mei:layer">
                <xsl:variable name="thisStaff">
                  <xsl:choose>
                    <xsl:when test="contains(*[1]/@staff, ' ')">
                      <xsl:value-of select="substring-before(*[1]/@staff, ' ')"/>
                    </xsl:when>
                    <xsl:otherwise>
                      <xsl:value-of select="*[1]/@staff"/>
                    </xsl:otherwise>
                  </xsl:choose>
                </xsl:variable>
                <staff xmlns="http://www.music-encoding.org/ns/mei">
                  <xsl:attribute name="n">
                    <xsl:value-of select="$thisStaff"/>
                  </xsl:attribute>
                  <layer>
                    <xsl:attribute name="n">
                      <xsl:value-of select="@n"/>
                    </xsl:attribute>
                    <xsl:for-each select="*">
                      <xsl:copy-of select="."/>
                    </xsl:for-each>
                  </layer>
                </staff>
              </xsl:for-each>
            </xsl:for-each>
          </xsl:variable>
          <!--<xsl:copy-of select="$byStaff"/>-->

          <xsl:variable name="byStaff2">
            <xsl:for-each-group select="$byStaff/mei:staff" group-by="@n">
              <!--<xsl:variable name="thisStaff">
                <xsl:value-of select="@n"/>
              </xsl:variable>-->
              <staff xmlns="http://www.music-encoding.org/ns/mei">
                <xsl:attribute name="n">
                  <xsl:value-of select="current-grouping-key()"/>
                </xsl:attribute>
                <xsl:for-each select="current-group()">
                  <xsl:for-each select="mei:layer">
                    <layer>
                      <xsl:for-each select="*">
                        <xsl:variable name="thisElement">
                          <xsl:value-of select="local-name(.)"/>
                        </xsl:variable>
                        <xsl:element name="{$thisElement}">
                          <xsl:copy-of select="@*[local-name() != 'staff' and local-name() != 'part'
                            and local-name() != 'layer']"/>
                          <xsl:if test="@staff != ancestor::mei:staff/@n">
                            <xsl:copy-of select="@staff"/>
                          </xsl:if>
                          <xsl:copy-of select="*"/>
                        </xsl:element>
                      </xsl:for-each>
                    </layer>
                  </xsl:for-each>
                </xsl:for-each>
              </staff>
            </xsl:for-each-group>
          </xsl:variable>
          <!--<xsl:copy-of select="$byStaff2"/>-->

          <xsl:variable name="byStaff3">
            <xsl:for-each select="$byStaff2/mei:staff">
              <staff xmlns="http://www.music-encoding.org/ns/mei">
                <xsl:copy-of select="@*"/>
                <xsl:for-each select="mei:layer">
                  <layer>
                    <xsl:attribute name="n">
                      <xsl:value-of select="count(preceding-sibling::mei:layer) + 1"/>
                    </xsl:attribute>
                    <xsl:copy-of select="@*"/>
                    <xsl:for-each select="*">
                      <xsl:copy-of select="."/>
                    </xsl:for-each>
                  </layer>
                </xsl:for-each>
              </staff>
            </xsl:for-each>
          </xsl:variable>
          <xsl:copy-of select="$byStaff3"/>

          <!-- KEEP THIS TO GENERATE strict byStaff organization! -->
          <!-- Further process $byPart: create staff and layer elements. -->
          <!--<xsl:variable name="byStaff">
            <xsl:for-each select="$byPart/mei:part">
              <xsl:variable name="thisPart">
                <xsl:value-of select="@n"/>
              </xsl:variable>
              <xsl:for-each select="mei:layer">
                <xsl:variable name="thisLayer">
                  <xsl:value-of select="@n"/>
                </xsl:variable>
                <xsl:variable name="staves">
                  <xsl:value-of select="distinct-values(*/@staff)"/>
                </xsl:variable>
                <xsl:variable name="countStaves">
                  <xsl:value-of select="count(distinct-values(*/@staff))"/>
                </xsl:variable>
                <xsl:choose>
                  <xsl:when test="$countStaves=1">
                    <!-\- The 'voice' lies on a single staff -\->
                    <xsl:for-each select="distinct-values(*/@staff)">
                      <staff xmlns="http://www.music-encoding.org/ns/mei">
                        <xsl:attribute name="n">
                          <xsl:value-of select="."/>
                        </xsl:attribute>
                        <xsl:copy-of
                          select="$byPart/mei:part[@n=$thisPart]/mei:layer[@n=$thisLayer]/*"/>
                      </staff>
                    </xsl:for-each>
                  </xsl:when>
                  <xsl:otherwise>
                    <!-\- The 'voice' crosses staves -\->
                    <xsl:for-each select="distinct-values(*/@staff)">
                      <xsl:variable name="thisStaff">
                        <xsl:value-of select="."/>
                      </xsl:variable>
                      <staff xmlns="http://www.music-encoding.org/ns/mei">
                        <xsl:attribute name="n">
                          <xsl:value-of select="$thisStaff"/>
                        </xsl:attribute>
                        <xsl:for-each
                          select="$byPart/mei:part[@n=$thisPart]/mei:layer[@n=$thisLayer]/*[name()='note'
                          or name()='chord' or name()='mRest' or name()='rest' or name()='space' or
                          name()='clef']">
                          <!-\- Fill the unused time on 'the other staves' with space -\->
                          <xsl:choose>
                            <xsl:when test="@staff=$thisStaff">
                              <xsl:copy-of select="."/>
                            </xsl:when>
                            <xsl:otherwise>
                              <xsl:apply-templates select="." mode="insertSpace"/>
                            </xsl:otherwise>
                          </xsl:choose>
                        </xsl:for-each>
                      </staff>
                    </xsl:for-each>
                  </xsl:otherwise>
                </xsl:choose>
              </xsl:for-each>
            </xsl:for-each>
          </xsl:variable>-->
          <!--<xsl:copy-of select="$byStaff"/>-->

          <!-- Further process $byStaff: sort by staff, then by layer -->
          <!--<xsl:variable name="byStaff2">
            <xsl:for-each select="$byStaff/mei:staff">
              <xsl:sort select="@n"/>
              <staff xmlns="http://www.music-encoding.org/ns/mei">
                <xsl:copy-of select="@*"/>
                <xsl:for-each-group select="child::*" group-by="@layer">
                  <xsl:sort select="current-grouping-key()"/>
                  <layer>
                    <xsl:attribute name="n">
                      <xsl:value-of select="current-grouping-key()"/>
                    </xsl:attribute>
                    <xsl:copy-of select="current-group()"/>
                  </layer>
                </xsl:for-each-group>
              </staff>
            </xsl:for-each>
          </xsl:variable>
          <xsl:copy-of select="$byStaff2"/>-->

          <!--<xsl:for-each select="$byStaff2/mei:staff">
            <xsl:for-each select="mei:layer">
              <xsl:if test="count(*[starts-with(@beam, 'i')]) != count(*[starts-with(@beam, 't')])">
                <xsl:variable name="errorMessage">
                  <xsl:text>Beam not terminated! (m. </xsl:text>
                  <xsl:value-of select="$measureNum"/>
                  <xsl:text>, s. </xsl:text>
                  <xsl:value-of select="ancestor::mei:staff/@n"/>
                  <xsl:text>, v. </xsl:text>
                  <xsl:value-of select="@n"/>
                  <xsl:text>)</xsl:text>
                </xsl:variable>
                <xsl:message terminate="yes">
                  <xsl:value-of select="normalize-space($errorMessage)"/>
                </xsl:message>
              </xsl:if>
              <xsl:if test="count(*[starts-with(@tuplet, 'i')]) != count(*[starts-with(@tuplet,
                't')])">
                <xsl:variable name="errorMessage">
                  <xsl:text>Tuplet not terminated! (m. </xsl:text>
                  <xsl:value-of select="$measureNum"/>
                  <xsl:text>, s. </xsl:text>
                  <xsl:value-of select="ancestor::mei:staff/@n"/>
                  <xsl:text>, v. </xsl:text>
                  <xsl:value-of select="@n"/>
                  <xsl:text>)</xsl:text>
                </xsl:variable>
                <xsl:message terminate="yes">
                  <xsl:value-of select="normalize-space($errorMessage)"/>
                </xsl:message>
              </xsl:if>
            </xsl:for-each>
          </xsl:for-each>-->

          <!-- Further process $byStaff2: create beam and tuplet elements -->
          <!--<xsl:variable name="byStaff3">
            <xsl:for-each-group select="$byStaff2/mei:staff" group-by="@n">
              <xsl:variable name="thisStaff">
                <xsl:value-of select="current-grouping-key()"/>
              </xsl:variable>
              <xsl:variable name="staffLayer">
                <staff xmlns="http://www.music-encoding.org/ns/mei">
                  <xsl:copy-of select="@*"/>
                  <xsl:copy-of select="$byStaff2/mei:staff[@n=$thisStaff]/mei:layer"/>
                </staff>
              </xsl:variable>
              <xsl:for-each select="$staffLayer/mei:staff">
                <staff xmlns="http://www.music-encoding.org/ns/mei">
                  <xsl:copy-of select="@*"/>
                  <xsl:for-each select="mei:layer">
                    <xsl:sort select="@n"/>
                    <layer>
                      <xsl:copy-of select="@*[not(name()='n')]"/>
                      <xsl:attribute name="n">
                        <xsl:value-of select="position()"/>
                      </xsl:attribute>
                      <xsl:if test="*[@tstamp.ges][1]/@tstamp.ges != 0">
                        <!-\- If the 1st event in the layer doesn't have a timestamp of 0, insert space. -\->
                        <!-\- DEBUG: -\->
                        <xsl:message>Timestamp on 1st event is not 0!</xsl:message>
                        <space>
                          <xsl:attribute name="xml:id">
                            <xsl:value-of select="generate-id(*[@tstamp.ges][1]/@tstamp.ges)"/>
                          </xsl:attribute>
                          <xsl:attribute name="tstamp.ges">0</xsl:attribute>
                          <xsl:attribute name="dur.ges">
                            <xsl:value-of select="*[@tstamp.ges][1]/@tstamp.ges"/>
                            <xsl:text>p</xsl:text>
                          </xsl:attribute>
                        </space>
                      </xsl:if>

                      <xsl:for-each select="*">
                        <xsl:choose>
                          <!-\- starts beam -\->
                          <xsl:when test="starts-with(@beam, 'i')">
                            <xsl:variable name="beamLevel">
                              <xsl:value-of select="substring(@beam, 2)"/>
                            </xsl:variable>
                            <xsl:choose>
                              <!-\- also starts tuplet -\->
                              <xsl:when test="starts-with(@tuplet, 'i')">
                                <xsl:variable name="endBeam" as="xs:integer">
                                  <xsl:value-of
                                    select="count(following-sibling::*[starts-with(@beam,
                                    concat('t',$beamLevel))][1]/preceding-sibling::*)+1"/>
                                </xsl:variable>
                                <xsl:variable name="tupletLevel">
                                  <xsl:value-of select="substring(@tuplet, 2)"/>
                                </xsl:variable>
                                <xsl:variable name="endTuplet" as="xs:integer">
                                  <xsl:value-of
                                    select="count(following-sibling::*[starts-with(@tuplet,
                                    concat('t', $tupletLevel))][1]/preceding-sibling::*)+1"/>
                                </xsl:variable>
                                <xsl:choose>
                                  <!-\- beam and tuplet end simultaneously, beam is superfluous -\->
                                  <xsl:when test="$endBeam = $endTuplet">
                                    <xsl:text>&tupletstart;</xsl:text>
                                    <xsl:copy-of select="."/>
                                  </xsl:when>
                                  <!-\- tuplet ends before beam, open beam first -\->
                                  <xsl:when test="$endTuplet &lt; $endBeam">
                                    <xsl:text>&beamstart;&tupletstart;</xsl:text>
                                    <xsl:copy-of select="."/>
                                  </xsl:when>
                                  <!-\- tuplet ends after beam, open tuplet first -\->
                                  <xsl:when test="$endTuplet &gt; $endBeam">
                                    <xsl:text>&tupletstart;&beamstart;</xsl:text>
                                    <xsl:copy-of select="."/>
                                  </xsl:when>
                                </xsl:choose>
                              </xsl:when>
                              <!-\- starts beam, but not tuplet -\->
                              <xsl:otherwise>
                                <xsl:text>&beamstart;</xsl:text>
                                <xsl:copy-of select="."/>
                              </xsl:otherwise>
                            </xsl:choose>
                          </xsl:when>
                          <!-\- ends beam -\->
                          <xsl:when test="starts-with(@beam,'t')">
                            <xsl:variable name="beamLevel">
                              <xsl:value-of select="substring(@beam, 2)"/>
                            </xsl:variable>
                            <xsl:choose>
                              <!-\- also ends tuplet -\->
                              <xsl:when test="starts-with(@tuplet, 't')">
                                <xsl:variable name="startBeam" as="xs:integer">
                                  <xsl:value-of
                                    select="count(preceding-sibling::*[starts-with(@beam,
                                    concat('i', $beamLevel))][1]/preceding-sibling::*)+1"/>
                                </xsl:variable>
                                <xsl:variable name="tupletLevel">
                                  <xsl:value-of select="substring(@tuplet, 2)"/>
                                </xsl:variable>
                                <xsl:variable name="startTuplet" as="xs:integer">
                                  <xsl:value-of
                                    select="count(preceding-sibling::*[starts-with(@tuplet,
                                    concat('i', $tupletLevel))][1]/preceding-sibling::*)+1"/>
                                </xsl:variable>
                                <xsl:choose>
                                  <!-\- beam and tuplet start simultaneously, beam is superfluous -\->
                                  <xsl:when test="$startBeam = $startTuplet">
                                    <xsl:copy-of select="."/>
                                    <xsl:text>&tupletend;</xsl:text>
                                  </xsl:when>
                                  <!-\- tuplet starts before beam, close beam first -\->
                                  <xsl:when test="$startTuplet &lt; $startBeam">
                                    <xsl:copy-of select="."/>
                                    <xsl:text>&beamend;&tupletend;</xsl:text>
                                  </xsl:when>
                                  <!-\- tuplet starts after beam, close tuplet first -\->
                                  <xsl:when test="$startTuplet &gt; $startBeam">
                                    <xsl:copy-of select="."/>
                                    <xsl:text>&tupletend;&beamend;</xsl:text>
                                  </xsl:when>
                                </xsl:choose>
                              </xsl:when>
                              <!-\- ends beam, but not tuplet -\->
                              <xsl:otherwise>
                                <xsl:copy-of select="."/>
                                <xsl:text>&beamend;</xsl:text>
                              </xsl:otherwise>
                            </xsl:choose>
                          </xsl:when>
                          <!-\- starts tuplet, but not beam -\->
                          <xsl:when test="starts-with(@tuplet, 'i')">
                            <xsl:text>&tupletstart;</xsl:text>
                            <xsl:copy-of select="."/>
                          </xsl:when>
                          <!-\- ends tuplet, but not beam -\->
                          <xsl:when test="starts-with(@tuplet, 't')">
                            <xsl:copy-of select="."/>
                            <xsl:text>&tupletend;</xsl:text>
                          </xsl:when>
                          <!-\- no beam or tuplet, or middle notes of beam and tuplet -\->
                          <xsl:otherwise>
                            <xsl:copy-of select="."/>
                          </xsl:otherwise>
                        </xsl:choose>
                      </xsl:for-each>
                    </layer>
                  </xsl:for-each>
                </staff>
              </xsl:for-each>
            </xsl:for-each-group>
          </xsl:variable>
          <xsl:copy-of select="$byStaff3"/>-->

        </xsl:for-each-group>

        <!-- Copy controlevents -->
        <xsl:copy-of select="mei:annot|mei:arpeg|mei:beamspan|mei:bend|mei:dir|mei:dynam|
          mei:fermata|mei:gliss|mei:hairpin|mei:harm|mei:lyrics|mei:midi|
          mei:mordent|mei:octave|mei:pedal|mei:reh|mei:slur|mei:tempo|mei:tie|
          mei:trill|mei:tupletspan|mei:turn"/>

        <!-- Copy graphic primitives -->
        <xsl:copy-of select="curve|line"/>

      </measure>
    </xsl:for-each>

  </xsl:template>

  <xsl:template match="mei:chord" mode="chordThis">
    <!-- Copy some note attributes to the parent chord -->
    <xsl:variable name="chordThis2">
      <chord xmlns="http://www.music-encoding.org/ns/mei">
        <xsl:attribute name="xml:id">
          <xsl:value-of select="generate-id()"/>
        </xsl:attribute>

        <!-- Copy note attributes that always rightfully belong to the whole chord -->
        <xsl:copy-of select="mei:note[1]/@dots | mei:note[1]/@dur | mei:note[1]/@dur.ges |
          mei:note[1]/@stem.dir | mei:note[1]/@stem.len | mei:note[1]/@tstamp.ges |
          mei:note[1]/@tuplet"/>

        <!-- Copy these attrs if even *one* of the notes has the attr -->
        <xsl:if test="mei:note[@fermata]">
          <xsl:copy-of select="mei:note[@fermata][1]/@fermata"/>
        </xsl:if>
        <xsl:if test="mei:note[@grace]">
          <xsl:copy-of select="mei:note[@grace][1]/@grace"/>
        </xsl:if>
        <xsl:if test="mei:note[@beam]">
          <xsl:copy-of select="mei:note[@beam][1]/@beam"/>
        </xsl:if>
        <xsl:if test="mei:note[@stem.x]">
          <xsl:copy-of select="mei:note[@stem.x][1]/@stem.x"/>
        </xsl:if>

        <!-- Copy these attrs if *all* notes have the the same value for the attribute -->
        <xsl:if test="count(mei:note[@part])=count(mei:note)">
          <xsl:if test="count(distinct-values(mei:note/@part))=1">
            <xsl:copy-of select="mei:note[@part][1]/@part"/>
          </xsl:if>
        </xsl:if>
        <xsl:if test="count(mei:note[@staff])=count(mei:note)">
          <xsl:if test="count(distinct-values(mei:note/@staff))=1">
            <xsl:copy-of select="mei:note[@staff][1]/@staff"/>
          </xsl:if>
        </xsl:if>
        <xsl:if test="count(mei:note[@layer])=count(mei:note)">
          <xsl:if test="count(distinct-values(mei:note/@layer))=1">
            <xsl:copy-of select="mei:note[@staff][1]/@layer"/>
          </xsl:if>
        </xsl:if>
        <xsl:if test="count(mei:note[@size])=count(mei:note)">
          <xsl:if test="count(distinct-values(mei:note/@size))=1">
            <xsl:copy-of select="mei:note[@size][1]/@size"/>
          </xsl:if>
        </xsl:if>
        <xsl:if test="count(mei:note[@instr])=count(mei:note)">
          <xsl:if test="count(distinct-values(mei:note/@instr))=1">
            <xsl:copy-of select="mei:note[@instr][1]/@instr"/>
          </xsl:if>
        </xsl:if>
        <xsl:if test="count(mei:note[@beam])=count(mei:note)">
          <xsl:if test="count(distinct-values(mei:note/@beam))=1">
            <xsl:copy-of select="mei:note[@beam][1]/@beam"/>
          </xsl:if>
        </xsl:if>
        <xsl:if test="count(mei:note[@tie])=count(mei:note)">
          <xsl:if test="count(distinct-values(mei:note/@tie))=1">
            <xsl:copy-of select="mei:note[@tie][1]/@tie"/>
          </xsl:if>
        </xsl:if>
        <xsl:if test="count(mei:note[@grace.time])=count(mei:note)">
          <xsl:if test="count(distinct-values(mei:note/@grace.time))=1">
            <xsl:copy-of select="mei:note[@grace.time][1]/@grace.time"/>
          </xsl:if>
        </xsl:if>
        <xsl:if test="count(mei:note[@headshape])=count(mei:note)">
          <xsl:if test="count(distinct-values(mei:note/@headshape))=1">
            <xsl:copy-of select="mei:note[@altsym][1]/@headshape"/>
          </xsl:if>
        </xsl:if>
        <xsl:if test="count(mei:note[@x])=count(mei:note)">
          <xsl:if test="count(distinct-values(mei:note/@x))=1">
            <xsl:copy-of select="mei:note[@x][1]/@x"/>
          </xsl:if>
        </xsl:if>

        <!-- Copy notes -->
        <xsl:copy-of select="mei:note"/>
      </chord>
    </xsl:variable>
    <xsl:apply-templates select="$chordThis2/mei:chord" mode="thinNoteAttributes"/>
  </xsl:template>

  <xsl:template match="mei:chord" mode="thinNoteAttributes">
    <!-- Eliminate note attributes copied to parent chord -->
    <chord xmlns="http://www.music-encoding.org/ns/mei">
      <xsl:copy-of select="@*"/>
      <xsl:variable name="sortedStaff">
        <xsl:perform-sort select="distinct-values(mei:note/@staff)">
          <xsl:sort select="." data-type="number"/>
        </xsl:perform-sort>
      </xsl:variable>
      <xsl:attribute name="staff">
        <xsl:value-of select="$sortedStaff"/>
      </xsl:attribute>
      <xsl:variable name="sortedLayer">
        <xsl:perform-sort select="distinct-values(mei:note/@layer)">
          <xsl:sort select="." data-type="number"/>
        </xsl:perform-sort>
      </xsl:variable>
      <xsl:attribute name="layer">
        <xsl:value-of select="$sortedLayer"/>
      </xsl:attribute>
      <xsl:for-each select="mei:note">
        <xsl:sort select="@staff"/>
        <xsl:sort select="@layer"/>
        <note xmlns="http://www.music-encoding.org/ns/mei">
          <xsl:copy-of select="@xml:id"/>
          <xsl:for-each select="@*">
            <xsl:variable name="thisAttr">
              <xsl:value-of select="name(.)"/>
            </xsl:variable>
            <!-- Copy any other note attributes (except @id which was handled above) that
            don't already exist on the parent chord -->
            <xsl:if test="not(ancestor::mei:chord/@*[name()=$thisAttr])">
              <xsl:copy-of select="."/>
            </xsl:if>
          </xsl:for-each>
          <!-- Copy any children of the note -->
          <xsl:copy-of select="child::*"/>
        </note>
      </xsl:for-each>
    </chord>
  </xsl:template>

  <xsl:template match="mei:staffDef|mei:staffGrp|part-group" mode="numberStaves">
    <!-- Number staves -->
    <xsl:choose>
      <xsl:when test="local-name()='staffDef'">
        <staffDef xmlns="http://www.music-encoding.org/ns/mei">
          <xsl:attribute name="n">
            <xsl:value-of select="count(preceding::mei:staffDef) + 1"/>
          </xsl:attribute>
          <xsl:copy-of select="@*|node()"/>
        </staffDef>
      </xsl:when>
      <xsl:when test="local-name()='staffGrp'">
        <staffGrp xmlns="http://www.music-encoding.org/ns/mei">
          <xsl:copy-of select="@*|mei:instrDef"/>
          <xsl:for-each select="mei:staffDef">
            <staffDef xmlns="http://www.music-encoding.org/ns/mei">
              <xsl:attribute name="n">
                <xsl:value-of select="count(preceding::mei:staffDef) + 1"/>
              </xsl:attribute>
              <xsl:copy-of select="@*|node()"/>
            </staffDef>
          </xsl:for-each>
        </staffGrp>
      </xsl:when>
      <xsl:otherwise>
        <xsl:copy-of select="(.)"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template match="note[not(chord)]" mode="stage1">
    <!-- Non-chord tones -->
    <xsl:choose>
      <xsl:when test="following-sibling::note[1][chord]">
        <xsl:variable name="chordThis">
          <chord xmlns="http://www.music-encoding.org/ns/mei">
            <xsl:apply-templates select="." mode="oneNote"/>
          </chord>
        </xsl:variable>
        <xsl:apply-templates select="$chordThis/mei:chord" mode="chordThis"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:apply-templates select="." mode="oneNote"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template match="note" mode="oneNote">
    <!-- Create a note/rest element -->
    <xsl:choose>
      <xsl:when test="rest">
        <xsl:variable name="thisPart">
          <xsl:value-of select="ancestor::part/@id"/>
        </xsl:variable>
        <xsl:variable name="ppq">
          <xsl:choose>
            <xsl:when test="ancestor::part[attributes/divisions]">
              <xsl:value-of select="ancestor::part[attributes/divisions]/attributes/divisions"/>
            </xsl:when>
            <xsl:when test="preceding::part[@id=$thisPart and attributes/divisions]">
              <xsl:value-of select="preceding::part[@id=$thisPart and
                attributes/divisions][1]/attributes/divisions"/>
            </xsl:when>
          </xsl:choose>
        </xsl:variable>
        <xsl:variable name="meterCount">
          <xsl:choose>
            <xsl:when test="ancestor::part[attributes/time/beats]/attributes/time/beats">
              <xsl:value-of select="ancestor::part[attributes/time/beats]/attributes/time/beats"/>
            </xsl:when>
            <xsl:when test="preceding::part[@id=$thisPart and attributes/time]">
              <xsl:value-of select="preceding::part[@id=$thisPart and
                attributes/time][1]/attributes/time/beats"/>
            </xsl:when>
            <xsl:otherwise>
              <xsl:value-of select="sum(ancestor::part/note/duration) div $ppq"/>
            </xsl:otherwise>
          </xsl:choose>
        </xsl:variable>
        <xsl:variable name="meterUnit">
          <xsl:choose>
            <xsl:when test="ancestor::part[@id=$thisPart and
              attributes/time/beat-type]/attributes/time/beat-type">
              <xsl:value-of select="ancestor::part[@id=$thisPart and
                attributes/time/beat-type]/attributes/time/beat-type"/>
            </xsl:when>
            <xsl:when test="preceding::part[@id=$thisPart and attributes/time]">
              <xsl:value-of select="preceding::part[@id=$thisPart and
                attributes/time][1]/attributes/time/beat-type"/>
            </xsl:when>
            <xsl:otherwise>4</xsl:otherwise>
          </xsl:choose>
        </xsl:variable>
        <xsl:variable name="measureDuration">
          <xsl:call-template name="measureDuration">
            <xsl:with-param name="meterCount">
              <xsl:value-of select="$meterCount"/>
            </xsl:with-param>
            <xsl:with-param name="meterUnit">
              <xsl:value-of select="$meterUnit"/>
            </xsl:with-param>
            <xsl:with-param name="ppq">
              <xsl:value-of select="$ppq"/>
            </xsl:with-param>
          </xsl:call-template>
        </xsl:variable>
        <xsl:variable name="restType">
          <xsl:choose>
            <!-- whole rest and no other events present -->
            <xsl:when test="type='whole' and
              count(preceding-sibling::note)+count(following-sibling::note)=0">
              <xsl:text>mRest</xsl:text>
            </xsl:when>
            <!-- has visual duration -->
            <xsl:when test="type">
              <xsl:text>rest</xsl:text>
            </xsl:when>
            <!-- rest duration equals measure duration -->
            <xsl:when test="duration = $measureDuration">
              <xsl:text>mRest</xsl:text>
            </xsl:when>
            <!-- rest claims measure duration -->
            <xsl:when test="rest/@measure='yes'">
              <xsl:choose>
                <xsl:when test="duration = $measureDuration">
                  <xsl:text>mRest</xsl:text>
                </xsl:when>
                <xsl:otherwise>
                  <xsl:text>rest</xsl:text>
                </xsl:otherwise>
              </xsl:choose>
            </xsl:when>
            <!-- all other cases -->
            <xsl:otherwise>
              <xsl:text>rest</xsl:text>
            </xsl:otherwise>
          </xsl:choose>
        </xsl:variable>
        <xsl:element name="{$restType}" namespace="http://www.music-encoding.org/ns/mei">
          <xsl:attribute name="xml:id">
            <xsl:value-of select="generate-id()"/>
          </xsl:attribute>
          <xsl:attribute name="tstamp.ges">
            <xsl:call-template name="getTimestamp.ges"/>
          </xsl:attribute>
          <xsl:for-each select="type[1]">
            <xsl:attribute name="dur">
              <xsl:call-template name="notatedDuration"/>
            </xsl:attribute>
          </xsl:for-each>
          <xsl:call-template name="notatedDot"/>
          <xsl:call-template name="fermata"/>
          <xsl:if test="duration">
            <xsl:call-template name="gesturalDuration"/>
          </xsl:if>
          <xsl:call-template name="assignPart-Layer-Staff-Beam-Tuplet"/>
          <!--<xsl:call-template name="positionRelative"/>-->
          <xsl:call-template name="restvo"/>
          <xsl:call-template name="size"/>
        </xsl:element>
      </xsl:when>
      <xsl:otherwise>
        <!-- This is a 'pitched' or 'unpitched' note; i.e., not a rest. -->
        <note xmlns="http://www.music-encoding.org/ns/mei">
          <xsl:attribute name="xml:id">
            <xsl:value-of select="generate-id()"/>
          </xsl:attribute>
          <xsl:attribute name="tstamp.ges">
            <xsl:call-template name="getTimestamp.ges"/>
          </xsl:attribute>
          <xsl:if test="@print-object='no'">
            <xsl:attribute name="visible">false</xsl:attribute>
          </xsl:if>

          <!-- Grace note -->
          <xsl:if test="grace">
            <xsl:choose>
              <xsl:when test="grace/@steal-time-following">
                <xsl:attribute name="grace">acc</xsl:attribute>
                <xsl:attribute name="grace.time">
                  <xsl:value-of select="grace/@steal-time-following"/>
                  <xsl:text>%</xsl:text>
                </xsl:attribute>
                <xsl:if test="grace/@slash='yes'">
                  <xsl:attribute name="stem.mod">1slash</xsl:attribute>
                </xsl:if>
              </xsl:when>
              <xsl:when test="grace/@steal-time-previous">
                <xsl:attribute name="grace">unacc</xsl:attribute>
                <xsl:attribute name="grace.time">
                  <xsl:value-of select="grace/@steal-time-previous"/>
                  <xsl:text>%</xsl:text>
                </xsl:attribute>
                <xsl:if test="grace/@slash='yes'">
                  <xsl:attribute name="stem.mod">1slash</xsl:attribute>
                </xsl:if>
              </xsl:when>
              <xsl:otherwise>
                <xsl:attribute name="grace">unacc</xsl:attribute>
                <xsl:if test="grace/@slash='yes'">
                  <xsl:attribute name="stem.mod">1slash</xsl:attribute>
                </xsl:if>
              </xsl:otherwise>
            </xsl:choose>
          </xsl:if>

          <!-- Notated pitch -->
          <xsl:choose>
            <xsl:when test="pitch">
              <xsl:attribute name="pname">
                <xsl:value-of select="lower-case(pitch/step)"/>
              </xsl:attribute>
            </xsl:when>
            <xsl:otherwise>
              <!-- This note is unpitched, e.g., for unpitched percussion or of indeterminate pitch. -->
              <xsl:attribute name="pname">
                <xsl:value-of select="lower-case(unpitched/display-step)"/>
              </xsl:attribute>
            </xsl:otherwise>
          </xsl:choose>

          <!-- Notated accidental in attribute. -->
          <xsl:if test="accidental">
            <xsl:attribute name="accid">
              <xsl:choose>
                <xsl:when test="accidental = 'sharp'">s</xsl:when>
                <xsl:when test="accidental = 'natural'">n</xsl:when>
                <xsl:when test="accidental = 'flat'">f</xsl:when>
                <xsl:when test="accidental = 'double-sharp'">x</xsl:when>
                <xsl:when test="accidental = 'sharp-sharp'">ss</xsl:when>
                <xsl:when test="accidental = 'flat-flat'">ff</xsl:when>
                <xsl:when test="accidental = 'natural-sharp'">ns</xsl:when>
                <xsl:when test="accidental = 'natural-flat'">nf</xsl:when>
                <xsl:when test="accidental = 'quarter-flat'">fd</xsl:when>
                <xsl:when test="accidental = 'quarter-sharp'">su</xsl:when>
              </xsl:choose>
            </xsl:attribute>
          </xsl:if>

          <!-- Notated/performed octave -->
          <xsl:choose>
            <xsl:when test="pitch">
              <xsl:variable name="thisPart">
                <xsl:value-of select="ancestor::part/@id"/>
              </xsl:variable>
              <xsl:variable name="partStaff">
                <xsl:choose>
                  <xsl:when test="staff">
                    <xsl:value-of select="staff"/>
                  </xsl:when>
                  <xsl:otherwise>1</xsl:otherwise>
                </xsl:choose>
              </xsl:variable>
              <xsl:variable name="octaveShift">
                <xsl:value-of select="count(preceding::octaveShift[not(@type='stop') and
                  ancestor::part/@id=$thisPart and ancestor::direction/staff=$partStaff]) -
                  count(preceding::octaveShift[@type='stop' and ancestor::part/@id=$thisPart and
                  ancestor::direction/staff=$partStaff])"/>
              </xsl:variable>
              <xsl:choose>
                <xsl:when test="$octaveShift &gt; 0">
                  <xsl:variable name="shift">
                    <xsl:variable name="size">
                      <xsl:value-of select="preceding::octaveShift[1][not(@type='stop') and
                        ancestor::part/@id=$thisPart and
                        ancestor::direction/staff=$partStaff]/@size"/>
                    </xsl:variable>
                    <xsl:choose>
                      <xsl:when test="$size=8">1</xsl:when>
                      <xsl:when test="$size=15">2</xsl:when>
                    </xsl:choose>
                  </xsl:variable>
                  <xsl:variable name="direction">
                    <xsl:value-of select="preceding::octaveShift[1][not(@type='stop') and
                      ancestor::part/@id=$thisPart and ancestor::direction/staff=$partStaff]/@type"
                    />
                  </xsl:variable>
                  <xsl:choose>
                    <xsl:when test="$direction='down'">
                      <xsl:attribute name="oct">
                        <xsl:value-of select="pitch/octave - $shift"/>
                      </xsl:attribute>
                    </xsl:when>
                    <xsl:when test="$direction='up'">
                      <xsl:attribute name="oct">
                        <xsl:value-of select="pitch/octave + $shift"/>
                      </xsl:attribute>
                    </xsl:when>
                  </xsl:choose>
                  <xsl:attribute name="oct.ges">
                    <xsl:value-of select="pitch/octave"/>
                  </xsl:attribute>
                </xsl:when>
                <xsl:otherwise>
                  <xsl:attribute name="oct">
                    <xsl:value-of select="pitch/octave"/>
                  </xsl:attribute>
                </xsl:otherwise>
              </xsl:choose>
            </xsl:when>
            <xsl:otherwise>
              <!-- This note is of indeterminate pitch. -->
              <xsl:attribute name="oct">
                <xsl:value-of select="unpitched/display-octave"/>
              </xsl:attribute>
            </xsl:otherwise>
          </xsl:choose>

          <!-- String tablature -->
          <xsl:if test="notations/technical/string">
            <xsl:attribute name="tab.string">
              <xsl:value-of select="notations/technical/string"/>
            </xsl:attribute>
          </xsl:if>
          <xsl:if test="notations/technical/fret">
            <xsl:attribute name="tab.fret">
              <xsl:choose>
                <xsl:when test="matches(notations/technical/fret, '0')">
                  <xsl:text>o</xsl:text>
                </xsl:when>
                <xsl:otherwise>
                  <xsl:value-of select="notations/technical/fret"/>
                </xsl:otherwise>
              </xsl:choose>
            </xsl:attribute>
          </xsl:if>

          <!-- Note attributes -->
          <xsl:variable name="notatedDuration">
            <xsl:for-each select="type[1]">
              <xsl:call-template name="notatedDuration"/>
            </xsl:for-each>
          </xsl:variable>
          <xsl:if test="$notatedDuration != ''">
            <xsl:attribute name="dur">
              <xsl:value-of select="$notatedDuration"/>
            </xsl:attribute>
          </xsl:if>
          <xsl:call-template name="notatedDot"/>
          <xsl:call-template name="fermata"/>
          <xsl:call-template name="artics"/>
          <xsl:call-template name="gesturalDuration"/>
          <xsl:call-template name="assignPart-Layer-Staff-Beam-Tuplet"/>
          <!--<xsl:call-template name="positionRelative"/>-->
          <xsl:call-template name="size"/>

          <!-- Notated tie in attribute:
               I'm using notations/tied here instead of note/tie because note/tie
               doesn't provide indication of middle notes in a tie, only start and stop.
               None of the current MusicXML examples record the position of ties. -->
          <xsl:choose>
            <xsl:when test="notations/tied/@type='start' and notations/tied/@type='stop'">
              <xsl:attribute name="tie">m</xsl:attribute>
            </xsl:when>
            <xsl:when test="notations/tied/@type='start'">
              <xsl:attribute name="tie">i</xsl:attribute>
            </xsl:when>
            <xsl:when test="notations/tied/@type='stop'">
              <xsl:attribute name="tie">t</xsl:attribute>
            </xsl:when>
          </xsl:choose>

          <!-- Stem attributes: direction and length
               MusicXML uses a text value of 'none' to record a zero-length stem, but
               stem/@relative-y or @default-y to record non-zero stem length. -->
          <xsl:choose>
            <xsl:when test="stem='up'">
              <xsl:attribute name="stem.dir">up</xsl:attribute>
              <xsl:if test="stem/@relative-y != 0">
                <xsl:attribute name="stem.len">
                  <xsl:value-of select="format-number(abs(round-half-to-even(stem/@relative-y div
                    5,3)), '###0.########')"/>
                </xsl:attribute>
              </xsl:if>
              <!--<xsl:if test="stem/@default-y">
                <xsl:attribute name="stem.y">
                  <xsl:value-of
                    select="abs(round-half-to-even(stem/@default-y div 5,3))"/>
                </xsl:attribute>
              </xsl:if>-->
            </xsl:when>
            <xsl:when test="stem='down'">
              <xsl:attribute name="stem.dir">down</xsl:attribute>
              <xsl:if test="stem/@relative-y != 0">
                <xsl:attribute name="stem.len">
                  <xsl:value-of select="format-number(abs(round-half-to-even(stem/@relative-y div
                    5,3)), '###0.########')"/>
                  <!-- <xsl:text>vu</xsl:text> -->
                </xsl:attribute>
              </xsl:if>
              <!--<xsl:if test="stem/@default-y">
                <xsl:attribute name="stem.y">
                  <xsl:value-of
                    select="abs(round-half-to-even(stem/@default-y,3))"/>
                </xsl:attribute>
              </xsl:if>-->
            </xsl:when>
            <xsl:when test="stem='none'">
              <xsl:attribute name="stem.len">0</xsl:attribute>
            </xsl:when>
            <xsl:when test="stem='double'">
              <!-- MEI doesn't allow 'double' stems because this is an indication
                of multiple layers. -->
            </xsl:when>
          </xsl:choose>

          <!-- Bowed tremolo -->
          <xsl:if test="notations/ornaments/tremolo">
            <xsl:attribute name="stem.mod">
              <xsl:value-of select="notations/ornaments/tremolo"/>
              <xsl:text>slash</xsl:text>
            </xsl:attribute>
          </xsl:if>

          <!-- Notehead shape -->
          <!-- It's not usually necessary to be explicit about whether
          the notehead is filled or not since the shape ought to be
          filled if the duration is <= quarter and open otherwise.
          However, this part of the stylesheet can be tweaked later. -->
          <xsl:choose>
            <xsl:when test="notehead='slash'">
              <xsl:attribute name="headshape">slash</xsl:attribute>
            </xsl:when>
            <xsl:when test="notehead='triangle'">
              <xsl:attribute name="headshape">isotriangle</xsl:attribute>
            </xsl:when>
            <xsl:when test="notehead='diamond'">
              <xsl:attribute name="headshape">diamond</xsl:attribute>
            </xsl:when>
            <xsl:when test="notehead='square'">
              <xsl:attribute name="headshape">rectangle</xsl:attribute>
            </xsl:when>
            <xsl:when test="notehead='cross'">
              <xsl:attribute name="headshape">cross</xsl:attribute>
            </xsl:when>
            <xsl:when test="notehead='x'">
              <xsl:attribute name="headshape">x</xsl:attribute>
            </xsl:when>
            <xsl:when test="notehead='circle-x'">
              <xsl:attribute name="headshape">circlex</xsl:attribute>
            </xsl:when>
            <xsl:when test="notehead='inverted triangle'">
              <xsl:attribute name="headshape">isotriangle</xsl:attribute>
            </xsl:when>
            <xsl:when test="notehead='arrow down'">
              <xsl:attribute name="headshape">isotriangle</xsl:attribute>
              <!-- Mup doesn't support centered stems -->
              <xsl:attribute name="stem.pos">center</xsl:attribute>
            </xsl:when>
            <xsl:when test="notehead='arrow up'">
              <xsl:attribute name="headshape">isotriangle</xsl:attribute>
              <!-- Mup doesn't support centered stems -->
              <xsl:attribute name="stem.pos">center</xsl:attribute>
            </xsl:when>
            <xsl:when test="notehead='slashed'">
              <!-- addslash must be added to the list of allowed values
              for the headshape attribute -->
              <xsl:attribute name="headshape">addslash</xsl:attribute>
            </xsl:when>
            <xsl:when test="notehead='back slashed'">
              <!-- addbackslash must be added to the list of allowed
              values for the headshape attribute -->
              <xsl:attribute name="headshape">addbackslash</xsl:attribute>
            </xsl:when>
            <xsl:when test="notehead='normal'">
              <!-- Regular notehead, this is a no-op! -->
            </xsl:when>
            <xsl:when test="notehead='none'">
              <xsl:attribute name="headshape">blank</xsl:attribute>
            </xsl:when>
            <xsl:when test="notehead='do'">
              <xsl:attribute name="headshape">isotriangle</xsl:attribute>
            </xsl:when>
            <xsl:when test="notehead='re'">
              <xsl:attribute name="headshape">semicircle</xsl:attribute>
            </xsl:when>
            <xsl:when test="notehead='mi'">
              <xsl:attribute name="headshape">diamond</xsl:attribute>
            </xsl:when>
            <xsl:when test="notehead='fa'">
              <xsl:attribute name="headshape">righttriangle</xsl:attribute>
            </xsl:when>
            <xsl:when test="notehead='so'">
              <!-- Regular notehead, this is a no-op! -->
            </xsl:when>
            <xsl:when test="notehead='la'">
              <xsl:attribute name="headshape">rectangle</xsl:attribute>
            </xsl:when>
            <xsl:when test="notehead='ti'">
              <xsl:attribute name="headshape">piewedge</xsl:attribute>
            </xsl:when>
          </xsl:choose>

          <!-- Gestural accidentals in attribute -->
          <xsl:variable name="thisPitch">
            <xsl:value-of select="pitch/step"/>
          </xsl:variable>
          <xsl:variable name="thisOctave">
            <xsl:value-of select="pitch/octave"/>
          </xsl:variable>

          <!--<xsl:choose>
            <xsl:when test="pitch/alter = 2">
              <xsl:attribute name="accid.ges">ss</xsl:attribute>
            </xsl:when>
            <xsl:when test="pitch/alter = 1">
              <xsl:attribute name="accid.ges">s</xsl:attribute>
            </xsl:when>
            <xsl:when test="pitch/alter = -1">
              <xsl:attribute name="accid.ges">f</xsl:attribute>
            </xsl:when>
            <xsl:when test="pitch/alter = -2">
              <xsl:attribute name="accid.ges">ff</xsl:attribute>
            </xsl:when>
            <xsl:otherwise>-->
          <xsl:choose>
            <xsl:when test="accidental">
              <!-- Accidental already in effect on this note -->
            </xsl:when>
            <xsl:when test="pitch/alter">
              <xsl:choose>
                <xsl:when test="pitch/alter = 2">
                  <xsl:attribute name="accid.ges">ss</xsl:attribute>
                </xsl:when>
                <xsl:when test="pitch/alter = 1">
                  <xsl:attribute name="accid.ges">s</xsl:attribute>
                </xsl:when>
                <xsl:when test="pitch/alter = -1">
                  <xsl:attribute name="accid.ges">f</xsl:attribute>
                </xsl:when>
                <xsl:when test="pitch/alter = -2">
                  <xsl:attribute name="accid.ges">ff</xsl:attribute>
                </xsl:when>
              </xsl:choose>
            </xsl:when>
            <xsl:when test="preceding-sibling::note[pitch/step=$thisPitch and
              pitch/octave=$thisOctave and accidental]">
              <xsl:variable name="precedingAccidental">
                <xsl:value-of select="preceding-sibling::note[pitch/step=$thisPitch and
                  pitch/octave=$thisOctave and accidental][1]/accidental"/>
              </xsl:variable>
              <xsl:attribute name="accid.ges">
                <xsl:choose>
                  <xsl:when test="$precedingAccidental = 'sharp'">s</xsl:when>
                  <xsl:when test="$precedingAccidental = 'natural'">n</xsl:when>
                  <xsl:when test="$precedingAccidental = 'flat'">f</xsl:when>
                  <xsl:when test="$precedingAccidental = 'double-sharp'">x</xsl:when>
                  <xsl:when test="$precedingAccidental = 'sharp-sharp'">ss</xsl:when>
                  <xsl:when test="$precedingAccidental = 'flat-flat'">ff</xsl:when>
                  <xsl:when test="$precedingAccidental = 'natural-sharp'">ns</xsl:when>
                  <xsl:when test="$precedingAccidental = 'natural-flat'">nf</xsl:when>
                  <xsl:when test="$precedingAccidental = 'quarter-flat'">fd</xsl:when>
                  <xsl:when test="$precedingAccidental = 'quarter-sharp'">su</xsl:when>
                </xsl:choose>
              </xsl:attribute>
            </xsl:when>
          </xsl:choose>
          <!-- </xsl:otherwise>
          </xsl:choose>-->

          <!-- Instrument assignment -->
          <xsl:if test="instrument">
            <xsl:attribute name="instr">
              <xsl:value-of select="instrument/@id"/>
            </xsl:attribute>
            <xsl:variable name="noteNum">
              <xsl:value-of select="instrument/@id"/>
            </xsl:variable>
            <xsl:if test="preceding::midi-instrument[@id=$noteNum]/midi-unpitched">
              <xsl:attribute name="pnum">
                <xsl:value-of select="preceding::midi-instrument[@id=$noteNum][1]/midi-unpitched"/>
              </xsl:attribute>
            </xsl:if>
          </xsl:if>

          <!-- Lyrics in attribute -->
          <xsl:if test="lyric">
            <xsl:attribute name="syl">
              <xsl:for-each select="lyric">
                <xsl:value-of select="text"/>
                <xsl:if test="syllabic='begin' or syllabic='middle'">
                  <xsl:text>-</xsl:text>
                </xsl:if>
                <xsl:if test="extend">
                  <xsl:text>_</xsl:text>
                </xsl:if>
                <xsl:if test="position() != last()">
                  <xsl:text>//</xsl:text>
                </xsl:if>
              </xsl:for-each>
            </xsl:attribute>
          </xsl:if>

          <!-- Create note sub-elements -->
          <xsl:call-template name="accidentals"/>
          <xsl:call-template name="articulations"/>
          <xsl:apply-templates select="lyric" mode="stage1"/>

        </note>
        <!-- Test to see if following note is also part of the chord. -->
        <xsl:if test="following-sibling::note[1][chord]">
          <xsl:apply-templates select="following-sibling::note[1][chord]" mode="oneNote"/>
        </xsl:if>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template match="part-group[@type='start']" mode="grpSym">
    <!-- Create stand-off staff grouping symbols -->
    <grpSym level="{@number}">
      <xsl:attribute name="symbol">
        <xsl:value-of select="group-symbol"/>
      </xsl:attribute>
      <xsl:attribute name="start">
        <xsl:value-of select="following-sibling::mei:staffDef[1]/@n"/>
      </xsl:attribute>
      <xsl:variable name="level">
        <xsl:value-of select="@number"/>
      </xsl:variable>
      <xsl:attribute name="end">
        <xsl:for-each select="following-sibling::part-group[@type='stop' and @number=$level][1]">
          <xsl:value-of select="preceding-sibling::mei:staffDef[1]/@n"/>
        </xsl:for-each>
      </xsl:attribute>
      <!-- group label -->
      <xsl:if test="group-name or group-name-display">
        <xsl:attribute name="label">
          <xsl:choose>
            <xsl:when test="group-name-display">
              <xsl:value-of select="replace(replace(normalize-space(group-name-display), 'flat',
                '&#x266d;'), 'sharp', '&#x266f;')"/>
            </xsl:when>
            <xsl:otherwise>
              <xsl:value-of select="group-name"/>
            </xsl:otherwise>
          </xsl:choose>
        </xsl:attribute>
      </xsl:if>
      <!-- abbreviated group label -->
      <xsl:if test="group-abbreviation or group-abbreviation-display">
        <xsl:attribute name="label.abbr">
          <xsl:choose>
            <xsl:when test="group-abbreviation-display">
              <xsl:value-of select="replace(replace(normalize-space(group-abbreviation-display),
                'flat', '&#x266d;'), 'sharp', '&#x266f;')"/>
            </xsl:when>
            <xsl:otherwise>
              <xsl:value-of select="group-abbreviation"/>
            </xsl:otherwise>
          </xsl:choose>
        </xsl:attribute>
      </xsl:if>
      <xsl:if test="group-barline='yes'">
        <xsl:attribute name="barthru">
          <xsl:text>true</xsl:text>
        </xsl:attribute>
      </xsl:if>
    </grpSym>
  </xsl:template>

  <xsl:template match="part-group" mode="layout">
    <xsl:copy-of select="."/>
  </xsl:template>

  <xsl:template match="part-list" mode="layout">
    <!-- outerStaffGrp holds basic layout info -->
    <xsl:variable name="outerStaffGrp">
      <staffGrp xmlns="http://www.music-encoding.org/ns/mei">
        <xsl:variable name="tempTree">
          <!-- Create staffDef elements, copy part-group elements  -->
          <xsl:apply-templates select="score-part|part-group" mode="layout"/>
        </xsl:variable>
        <xsl:variable name="tempTree2">
          <!-- Number staves -->
          <xsl:apply-templates select="$tempTree" mode="numberStaves"/>
        </xsl:variable>
        <!-- Emit staffGrp and staffDef elements already created -->
        <xsl:copy-of select="$tempTree2/mei:staffGrp|$tempTree2/mei:staffDef"/>
        <!-- Create stand-off staff grouping symbols -->
        <xsl:apply-templates select="$tempTree2/part-group[@type='start' and group-symbol]"
          mode="grpSym"/>
      </staffGrp>
    </xsl:variable>

    <xsl:choose>
      <xsl:when test="$outerStaffGrp//grpSym">
        <!-- If there are stand-off grouping symbols, resolve them -->
        <xsl:call-template name="resolveGrpSym">
          <xsl:with-param name="in">
            <xsl:copy-of select="$outerStaffGrp"/>
          </xsl:with-param>
          <xsl:with-param name="maxLevel">
            <xsl:value-of select="number(max($outerStaffGrp//grpSym/@level))"/>
          </xsl:with-param>
          <xsl:with-param name="pass" select="number(1)"/>
        </xsl:call-template>
      </xsl:when>
      <xsl:otherwise>
        <!-- If there are no stand-off grouping symbols, processing of layout info is complete -->
        <xsl:copy-of select="$outerStaffGrp"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template match="score-part" mode="layout">
    <!-- Create staffDef elements -->
    <xsl:variable name="partID">
      <xsl:value-of select="@id"/>
    </xsl:variable>
    <xsl:variable name="staves">
      <xsl:choose>
        <xsl:when test="following::measure[1]/part[@id=$partID]/attributes/staves">
          <xsl:value-of select="max(following::measure[1]/part[@id=$partID]/attributes/staves)"/>
        </xsl:when>
        <xsl:otherwise>1</xsl:otherwise>
      </xsl:choose>
    </xsl:variable>
    <xsl:choose>
      <xsl:when test="$staves=1">
        <!-- When the part uses a single staff, create a staffDef element, get its
          attributes by calling staffInitialAttributes, then make a child instrument
          definition. -->
        <staffDef xmlns="http://www.music-encoding.org/ns/mei">
          <xsl:attribute name="xml:id">
            <xsl:value-of select="$partID"/>
          </xsl:attribute>
          <!-- staff label -->
          <xsl:if test="part-name or part-name-display">
            <xsl:attribute name="label">
              <xsl:choose>
                <xsl:when test="part-name-display">
                  <xsl:value-of select="replace(replace(normalize-space(part-name-display), 'flat',
                    '&#x266d;'), 'sharp', '&#x266f;')"/>
                </xsl:when>
                <xsl:otherwise>
                  <xsl:value-of select="part-name"/>
                </xsl:otherwise>
              </xsl:choose>
            </xsl:attribute>
          </xsl:if>
          <!-- abbreviated staff label -->
          <xsl:if test="part-abbreviation or part-abbreviation-display">
            <xsl:attribute name="label.abbr">
              <xsl:choose>
                <xsl:when test="part-abbreviation-display">
                  <xsl:value-of select="replace(replace(normalize-space(part-abbreviation-display),
                    'flat', '&#x266d;'), 'sharp', '&#x266f;')"/>
                </xsl:when>
                <xsl:otherwise>
                  <xsl:value-of select="part-abbreviation"/>
                </xsl:otherwise>
              </xsl:choose>
            </xsl:attribute>
          </xsl:if>
          <xsl:call-template name="staffInitialAttributes">
            <xsl:with-param name="partID">
              <xsl:value-of select="$partID"/>
            </xsl:with-param>
            <xsl:with-param name="staffNum"/>
          </xsl:call-template>

          <!-- instrument definition -->
          <xsl:choose>
            <xsl:when test="midi-instrument">
              <xsl:for-each select="midi-instrument">
                <instrDef xmlns="http://www.music-encoding.org/ns/mei">
                  <xsl:variable name="thisID">
                    <xsl:value-of select="@id"/>
                  </xsl:variable>
                  <xsl:attribute name="xml:id">
                    <xsl:value-of select="@id"/>
                  </xsl:attribute>
                  <xsl:attribute name="midi.channel">
                    <xsl:value-of select="midi-channel"/>
                  </xsl:attribute>
                  <!-- It appears that MusicXML is using 1-based program numbers. Convert to 0-based. -->
                  <xsl:variable name="midiProgram">
                    <xsl:value-of select="number(midi-program)"/>
                  </xsl:variable>
                  <xsl:attribute name="midi.instrnum">
                    <xsl:value-of select="$midiProgram - 1"/>
                  </xsl:attribute>
                  <xsl:choose>
                    <xsl:when test="midi-channel != 10">
                      <xsl:if test="$midiNamesPitched/instrName[position()=$midiProgram] != ''">
                        <!-- Get MIDI instrument name from $midiNamesPitched -->
                        <xsl:attribute name="midi.instrname">
                          <xsl:value-of
                            select="$midiNamesPitched/instrName[position()=$midiProgram]"/>
                        </xsl:attribute>
                      </xsl:if>
                    </xsl:when>
                    <xsl:when test="midi-channel = 10">
                      <xsl:attribute name="label">
                        <xsl:value-of
                          select="preceding::score-instrument[@id=$thisID]/instrument-name"/>
                      </xsl:attribute>
                      <!-- Get MIDI instrument name from $midiNamesUnpitched -->
                      <xsl:variable name="midiUnpitched">
                        <xsl:value-of select="number(midi-unpitched) - 35"/>
                      </xsl:variable>
                      <xsl:if test="$midiNamesUnpitched/instrName[position()=$midiUnpitched] != ''">
                        <xsl:attribute name="midi.instrname">
                          <xsl:value-of
                            select="$midiNamesUnpitched/instrName[position()=$midiUnpitched]"/>
                        </xsl:attribute>
                      </xsl:if>
                    </xsl:when>
                  </xsl:choose>
                  <xsl:if test="volume">
                    <xsl:attribute name="midi.volume">
                      <xsl:value-of select="volume"/>
                    </xsl:attribute>
                  </xsl:if>
                  <xsl:if test="pan">
                    <xsl:attribute name="midi.pan">
                      <xsl:value-of select="pan"/>
                    </xsl:attribute>
                  </xsl:if>
                </instrDef>
              </xsl:for-each>
            </xsl:when>
            <xsl:when test="score-instrument">
              <xsl:for-each select="score-instrument">
                <instrDef xmlns="http://www.music-encoding.org/ns/mei">
                  <xsl:variable name="thisID">
                    <xsl:value-of select="@id"/>
                  </xsl:variable>
                  <xsl:attribute name="xml:id">
                    <xsl:value-of select="@id"/>
                  </xsl:attribute>
                  <xsl:attribute name="midi.channel">
                    <xsl:value-of select="count(preceding::score-instrument)+1"/>
                  </xsl:attribute>
                  <xsl:attribute name="midi.instrnum">0</xsl:attribute>
                </instrDef>
              </xsl:for-each>
            </xsl:when>
          </xsl:choose>

          <!-- CREATE LAYERDEFS HERE? -->

        </staffDef>
      </xsl:when>
      <xsl:otherwise>
        <!-- When there's more than one staff in the part, create a staffGrp and midi instrument
             definition(s) for the group, then the required number of MEI staffDef elements. -->
        <staffGrp xmlns="http://www.music-encoding.org/ns/mei">
          <xsl:attribute name="xml:id">
            <xsl:value-of select="$partID"/>
          </xsl:attribute>
          <!-- Single part with multiple staves always uses a bracket -->
          <xsl:attribute name="symbol">brace</xsl:attribute>
          <!-- group label -->
          <xsl:if test="part-name or part-name-display">
            <xsl:attribute name="label">
              <xsl:choose>
                <xsl:when test="part-name-display">
                  <xsl:value-of select="replace(replace(normalize-space(part-name-display), 'flat',
                    '&#x266d;'), 'sharp', '&#x266f;')"/>
                </xsl:when>
                <xsl:otherwise>
                  <xsl:value-of select="part-name"/>
                </xsl:otherwise>
              </xsl:choose>
            </xsl:attribute>
          </xsl:if>
          <!-- abbreviated group label -->
          <xsl:if test="part-abbreviation or part-abbreviation-display">
            <xsl:attribute name="label.abbr">
              <xsl:choose>
                <xsl:when test="part-abbreviation-display">
                  <xsl:value-of select="replace(replace(normalize-space(part-abbreviation-display),
                    'flat', '&#x266d;'), 'sharp', '&#x266f;')"/>
                </xsl:when>
                <xsl:otherwise>
                  <xsl:value-of select="part-abbreviation"/>
                </xsl:otherwise>
              </xsl:choose>
            </xsl:attribute>
          </xsl:if>
          <!-- instrument definition -->
          <xsl:for-each select="midi-instrument">
            <instrDef xmlns="http://www.music-encoding.org/ns/mei">
              <xsl:variable name="thisID">
                <xsl:value-of select="@id"/>
              </xsl:variable>
              <xsl:attribute name="xml:id">
                <xsl:value-of select="@id"/>
              </xsl:attribute>
              <xsl:attribute name="midi.channel">
                <xsl:value-of select="midi-channel"/>
              </xsl:attribute>
              <!-- It appears that MusicXML is using 1-based program numbers. Convert to 0-based. -->
              <xsl:variable name="midiProgram">
                <xsl:value-of select="number(midi-program)"/>
              </xsl:variable>
              <xsl:attribute name="midi.instrnum">
                <xsl:value-of select="$midiProgram - 1"/>
              </xsl:attribute>
              <xsl:choose>
                <xsl:when test="midi-channel != 10">
                  <xsl:if test="$midiNamesPitched/instrName[position()=$midiProgram] != ''">
                    <!-- Get MIDI instrument name from $midiNamesPitched -->
                    <xsl:attribute name="midi.instrname">
                      <xsl:value-of select="$midiNamesPitched/instrName[position()=$midiProgram]"/>
                    </xsl:attribute>
                  </xsl:if>
                </xsl:when>
                <xsl:when test="midi-channel = 10">
                  <xsl:attribute name="label">
                    <xsl:value-of select="preceding::score-instrument[@id=$thisID]/instrument-name"
                    />
                  </xsl:attribute>
                  <!-- Get MIDI instrument name from $midiNamesUnpitched -->
                  <xsl:variable name="midiUnpitched">
                    <xsl:value-of select="number(midi-unpitched) - 35"/>
                  </xsl:variable>
                  <xsl:if test="$midiNamesUnpitched/instrName[position()=$midiUnpitched] != ''">
                    <xsl:attribute name="midi.instrname">
                      <xsl:value-of
                        select="$midiNamesUnpitched/instrName[position()=$midiUnpitched]"/>
                    </xsl:attribute>
                  </xsl:if>
                </xsl:when>
              </xsl:choose>
              <xsl:if test="volume">
                <xsl:attribute name="midi.volume">
                  <xsl:value-of select="volume"/>
                </xsl:attribute>
              </xsl:if>
              <xsl:if test="pan">
                <xsl:attribute name="midi.pan">
                  <xsl:value-of select="pan"/>
                </xsl:attribute>
              </xsl:if>
            </instrDef>
          </xsl:for-each>
          <xsl:call-template name="makeStaff">
            <xsl:with-param name="partID">
              <xsl:value-of select="$partID"/>
            </xsl:with-param>
            <xsl:with-param name="needed">
              <xsl:value-of select="$staves"/>
            </xsl:with-param>
          </xsl:call-template>
        </staffGrp>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template match="score-timewise" mode="header">
    <meiHead xmlns="http://www.music-encoding.org/ns/mei">
      <fileDesc>
        <titleStmt>
          <title>
            <xsl:value-of select="normalize-space(work/work-title)"/>
            <xsl:if test="normalize-space(work/work-number) != ''">
              <xsl:text>, </xsl:text>
              <xsl:value-of select="normalize-space(work/work-number)"/>
            </xsl:if>
            <xsl:if test="normalize-space(movement-number) != ''">
              <xsl:text>, </xsl:text>
              <xsl:if test="number(normalize-space(movement-number))">
                <xsl:text>no. </xsl:text>
              </xsl:if>
              <xsl:value-of select="normalize-space(movement-number)"/>
            </xsl:if>
            <xsl:if test="normalize-space(movement-title) != ''">
              <xsl:if
                test="normalize-space(concat(work/work-title,work/work-number,movement-number)) !=
                ''">
                <xsl:text>.&#32;</xsl:text>
              </xsl:if>
              <xsl:value-of select="normalize-space(movement-title)"/>
            </xsl:if>
          </title>
          <xsl:if test="identification/creator">
            <respStmt>
              <xsl:for-each select="identification/creator">
                <xsl:value-of select="$nl"/>
                <resp>
                  <xsl:value-of select="@type"/>
                </resp>
                <name>
                  <xsl:value-of select="normalize-space(.)"/>
                </name>
              </xsl:for-each>
            </respStmt>
          </xsl:if>
        </titleStmt>
        <pubStmt/>
        <sourceDesc>
          <source>
            <titleStmt>
              <title>
                <xsl:value-of select="normalize-space(work/work-title)"/>
                <xsl:if test="normalize-space(work/work-number) != ''">
                  <xsl:text>, </xsl:text>
                  <xsl:value-of select="normalize-space(work/work-number)"/>
                </xsl:if>
                <xsl:if test="normalize-space(movement-number) != ''">
                  <xsl:text>, </xsl:text>
                  <xsl:if test="number(normalize-space(movement-number))">
                    <xsl:text>no. </xsl:text>
                  </xsl:if>
                  <xsl:value-of select="normalize-space(movement-number)"/>
                </xsl:if>
                <xsl:if test="normalize-space(movement-title) != ''">
                  <xsl:if
                    test="normalize-space(concat(work/work-title,work/work-number,movement-number))
                    != ''">
                    <xsl:text>. </xsl:text>
                  </xsl:if>
                  <xsl:value-of select="normalize-space(movement-title)"/>
                </xsl:if>
              </title>
              <xsl:if test="identification">
                <respStmt>
                  <xsl:for-each select="identification/creator">
                    <xsl:value-of select="$nl"/>
                    <resp>
                      <xsl:value-of select="@type"/>
                    </resp>
                    <name>
                      <xsl:value-of select="normalize-space(.)"/>
                    </name>
                  </xsl:for-each>
                  <xsl:for-each select="identification/encoding/encoder">
                    <name>
                      <xsl:attribute name="role">
                        <xsl:value-of select="@type"/>
                      </xsl:attribute>
                      <xsl:value-of select="normalize-space(.)"/>
                    </name>
                  </xsl:for-each>
                  <xsl:if test="not(identification/creator) and
                    not(identification/encoding/encoder)">
                    <name/>
                  </xsl:if>
                </respStmt>
              </xsl:if>
            </titleStmt>
            <pubStmt>
              <xsl:if test="identification/rights">
                <availability>
                  <useRestrict>
                    <xsl:value-of select="identification/rights"/>
                  </useRestrict>
                </availability>
              </xsl:if>
            </pubStmt>
            <xsl:if test="count(distinct-values(//*/@xml:lang)) &gt; 0">
              <langUsage>
                <xsl:for-each select="distinct-values(//*/@xml:lang)">
                  <!-- Identify all the languages used anywhere in the document. -->
                  <language>
                    <xsl:attribute name="xml:id">
                      <xsl:value-of select="."/>
                    </xsl:attribute>
                  </language>
                </xsl:for-each>
              </langUsage>
            </xsl:if>

            <xsl:if test="identification/encoding/software">
              <!-- MusicXML file encoding description -->
              <notesStmt>
                <xsl:variable name="software">
                  <xsl:value-of select="count(identification/encoding/software)"/>
                </xsl:variable>
                <annot>
                  <xsl:text>Created </xsl:text>
                  <xsl:if test="identification/encoding/encoder">
                    <xsl:text>by </xsl:text>
                    <xsl:for-each select="identification/encoding/encoder">
                      <xsl:value-of select="."/>
                      <xsl:if test="count(following-sibling::encoder) &gt; 1">
                        <xsl:text>, </xsl:text>
                      </xsl:if>
                      <xsl:if test="count(following-sibling::encoder) = 1">
                        <xsl:choose>
                          <xsl:when test="count(preceding-sibling::encoder) = 0">
                            <xsl:text> and </xsl:text>
                          </xsl:when>
                          <xsl:otherwise>
                            <xsl:text>, and </xsl:text>
                          </xsl:otherwise>
                        </xsl:choose>
                      </xsl:if>
                    </xsl:for-each>
                    <xsl:text>&#32;</xsl:text>
                  </xsl:if>
                  <xsl:if test="identification/encoding/software">
                    <xsl:text>using </xsl:text>
                    <xsl:for-each select="identification/encoding/software">
                      <xsl:value-of select="."/>
                      <xsl:if test="count(following-sibling::software) &gt; 1">
                        <xsl:text>, </xsl:text>
                      </xsl:if>
                      <xsl:if test="count(following-sibling::software) = 1">
                        <xsl:choose>
                          <xsl:when test="count(preceding-sibling::software) = 0">
                            <xsl:text> and </xsl:text>
                          </xsl:when>
                          <xsl:otherwise>
                            <xsl:text>, and </xsl:text>
                          </xsl:otherwise>
                        </xsl:choose>
                      </xsl:if>
                    </xsl:for-each>
                  </xsl:if>
                  <xsl:if test="identification/encoding/encoding-date">
                    <xsl:text> on </xsl:text>
                    <date>
                      <xsl:value-of select="identification/encoding/encoding-date"/>
                    </date>
                  </xsl:if>
                  <xsl:text>.</xsl:text>
                </annot>
                <xsl:if test="identification/encoding/encoding-description">
                  <annot>
                    <xsl:value-of select="identification/encoding/encoding-description"/>
                  </annot>
                </xsl:if>
              </notesStmt>
            </xsl:if>
          </source>
        </sourceDesc>
      </fileDesc>
      <!-- MEI file encoding description in encodingDesc -->
      <encodingDesc>
        <projectDesc>
          <p>
            <xsl:text>Transcoded from a MusicXML </xsl:text>
            <xsl:if test="@version">
              <xsl:text>version </xsl:text>
              <xsl:value-of select="@version"/>
              <xsl:text>&#32;</xsl:text>
            </xsl:if>
            <xsl:text>file on </xsl:text>
            <date>
              <xsl:value-of select="format-date(current-date(), '[Y]-[M02]-[D02]')"/>
            </date>
            <xsl:text>using an XSLT stylesheet (</xsl:text>
            <xsl:value-of select="$progName"/>
            <xsl:text>&#32;</xsl:text>
            <xsl:value-of select="$progVersion"/>
            <xsl:text>).</xsl:text>
          </p>
        </projectDesc>
        <xsl:if test="matches(work/work-title, '\(.*\)') or matches(movement-title, '\(.*\)') or
          matches(work/work-title, 'excerpt', 'i') or matches(movement-title, 'excerpt', 'i')">
          <xsl:variable name="warning">Based on the work and movement titles, a sampling declaration
            may be needed.</xsl:variable>
          <xsl:message>
            <xsl:value-of select="normalize-space($warning)"/>
          </xsl:message>
          <xsl:comment>
            <xsl:value-of select="normalize-space($warning)"/>
          </xsl:comment>
        </xsl:if>
      </encodingDesc>
      <xsl:if test="work/*">
        <workDesc>
          <work>
            <xsl:if test="normalize-space(work/work-number) != ''">
              <identifier>
                <xsl:value-of select="normalize-space(work/work-number)"/>
              </identifier>
            </xsl:if>
            <titleStmt>
              <title>
                <xsl:value-of select="normalize-space(work/work-title)"/>
                <xsl:if test="normalize-space(work/work-number) != ''">
                  <xsl:text>, </xsl:text>
                  <xsl:value-of select="normalize-space(work/work-number)"/>
                </xsl:if>
                <xsl:if test="normalize-space(movement-number) != ''">
                  <xsl:text>, </xsl:text>
                  <xsl:if test="number(normalize-space(movement-number))">
                    <xsl:text>no. </xsl:text>
                  </xsl:if>
                  <xsl:value-of select="normalize-space(movement-number)"/>
                </xsl:if>
                <xsl:if test="normalize-space(movement-title) != ''">
                  <xsl:if
                    test="normalize-space(concat(work/work-title,work/work-number,movement-number))
                    != ''">
                    <xsl:text>. </xsl:text>
                  </xsl:if>
                  <xsl:value-of select="normalize-space(movement-title)"/>
                </xsl:if>
              </title>
              <xsl:if test="identification/creator">
                <respStmt>
                  <xsl:for-each select="identification/creator">
                    <xsl:value-of select="$nl"/>
                    <resp>
                      <xsl:value-of select="@type"/>
                    </resp>
                    <name>
                      <xsl:value-of select="normalize-space(.)"/>
                    </name>
                  </xsl:for-each>
                </respStmt>
              </xsl:if>
            </titleStmt>
          </work>
        </workDesc>
      </xsl:if>
    </meiHead>
  </xsl:template>

  <xsl:template match="score-timewise" mode="music">
    <music xmlns="http://www.music-encoding.org/ns/mei">
      <body>
        <mdiv>
          <score>
            <scoreDef>
              <xsl:attribute name="ppq">
                <xsl:value-of select="$scorePPQ"/>
              </xsl:attribute>
              <!-- Look in first measure for score-level meter signature -->
              <xsl:if test="descendant::measure[1]/part/attributes">
                <xsl:if test="descendant::measure[1]/part/attributes[time/beats]">
                  <xsl:attribute name="meter.count">
                    <xsl:value-of
                      select="descendant::part[attributes/time/beats][1]/attributes/time/beats"/>
                  </xsl:attribute>
                </xsl:if>
                <xsl:if test="descendant::measure[1]/part/attributes[time/beat-type]">
                  <xsl:attribute name="meter.unit">
                    <xsl:value-of
                      select="descendant::part[attributes/time/beat-type][1]/attributes/time/beat-type"
                    />
                  </xsl:attribute>
                </xsl:if>
                <xsl:variable name="symbol">
                  <xsl:value-of
                    select="descendant::part[attributes/time/@symbol][1]/attributes/time/@symbol"/>
                </xsl:variable>
                <xsl:choose>
                  <xsl:when test="$symbol='common'">
                    <xsl:attribute name="meter.sym">common</xsl:attribute>
                  </xsl:when>
                  <xsl:when test="$symbol='cut'">
                    <xsl:attribute name="meter.sym">cut</xsl:attribute>
                  </xsl:when>
                  <xsl:when test="$symbol='single-number'">
                    <xsl:attribute name="meter.rend">denomsym</xsl:attribute>
                  </xsl:when>
                  <xsl:when
                    test="descendant::part[attributes/time/senza-misura][1]/attributes/time/senza-misura">
                    <xsl:attribute name="meter.rend">invis</xsl:attribute>
                  </xsl:when>
                </xsl:choose>
              </xsl:if>
              <!-- Look in first measure for score-level key signature and mode -->
              <xsl:if test="descendant::part/attributes[not(transpose)]/key">
                <xsl:variable name="keySig">
                  <xsl:value-of select="descendant::part[attributes[not(transpose) and
                    key]][1]/attributes/key/fifths"/>
                </xsl:variable>
                <xsl:choose>
                  <xsl:when test="$keySig=''">
                    <xsl:attribute name="key.sig">
                      <xsl:text>0</xsl:text>
                    </xsl:attribute>
                  </xsl:when>
                  <xsl:when test="number($keySig)=0">
                    <xsl:attribute name="key.sig">
                      <xsl:value-of select="$keySig"/>
                    </xsl:attribute>
                  </xsl:when>
                  <xsl:when test="number($keySig) &gt; 0">
                    <xsl:attribute name="key.sig"><xsl:value-of select="$keySig"/>s</xsl:attribute>
                  </xsl:when>
                  <xsl:when test="number($keySig) &lt; 0">
                    <xsl:attribute name="key.sig">
                      <xsl:value-of select="abs($keySig)"/>f</xsl:attribute>
                  </xsl:when>
                </xsl:choose>
                <xsl:if test="descendant::part/attributes/key/mode">
                  <xsl:attribute name="key.mode">
                    <xsl:value-of
                      select="descendant::part[attributes/key/mode][1]/attributes/key/mode"/>
                  </xsl:attribute>
                </xsl:if>
              </xsl:if>
              <!-- If any staves are not printed, then staff optimization is in effect. -->
              <xsl:if test="//measure/part/attributes/staff-details/@print-object='no'">
                <xsl:attribute name="optimize">true</xsl:attribute>
              </xsl:if>
              <!-- Look in first measure for other score-level attributes -->
              <xsl:apply-templates select="defaults"/>

              <!-- Create page headers and footers -->
              <xsl:call-template name="credits"/>

              <!-- Copy already-calculated layout here -->
              <xsl:copy-of select="$defaultLayout"/>
            </scoreDef>

            <!-- Process score measures -->
            <!-- Measures are grouped based on criteria in the group-ending-with attribute -->
            <xsl:for-each-group select="measure"
              group-ending-with="measure[part/barline/repeat[@direction='backward'] or
              following-sibling::measure[1][part/barline[@location='left']/repeat[@direction='forward']]
              or part/barline/ending[@type='stop'] or
              part/barline[@location='right']/bar-style='light-light' or
              following-sibling::measure[1][part/barline/ending[@type='start']] or
              following-sibling::measure[1][part/attributes[time or key]]]">

              <!-- Other potential (sub?) section-ending conditions:
following-sibling::measure[1][print/page-layout] or
following-sibling::measure[1][print/system-layout] or
following-sibling::measure[1][print/staff-layout] or
following-sibling::measure[1][print/measure-layout] or
following-sibling::measure[1][attributes[staves]] or
following-sibling::measure[1][attributes[not(preceding-sibling::note)]] -->

              <!-- Create sections/endings based on the grouping of measures -->
              <xsl:choose>
                <xsl:when test="part/barline/ending[@type='start']">
                  <ending>
                    <xsl:attribute name="n">
                      <xsl:choose>
                        <xsl:when test="part/barline/ending[@type='start'] != ''">
                          <xsl:value-of
                            select="part[barline/ending[@type='start']][1]/barline[ending[@type='start']][1]/ending"
                          />
                        </xsl:when>
                        <xsl:otherwise>
                          <xsl:value-of
                            select="part[barline/ending[@type='start']][1]/barline[ending[@type='start']][1]/ending/@number"
                          />
                        </xsl:otherwise>
                      </xsl:choose>
                    </xsl:attribute>
                    <xsl:for-each-group select="current-group()"
                      group-starting-with="measure[part/attributes[time or key]]">
                      <xsl:apply-templates select="current-group()" mode="measContent"/>
                    </xsl:for-each-group>
                  </ending>
                </xsl:when>
                <xsl:otherwise>
                  <section>
                    <xsl:for-each-group select="current-group()"
                      group-starting-with="measure[part/attributes[time or key]]">
                      <xsl:apply-templates select="current-group()" mode="measContent"/>
                    </xsl:for-each-group>
                  </section>
                </xsl:otherwise>
              </xsl:choose>
            </xsl:for-each-group>
          </score>
        </mdiv>
      </body>
    </music>
  </xsl:template>

  <!-- Functions -->
  <!-- f:hex2integer provided by Thomas Weber -->
  <xsl:function name="f:hex2integer" as="xs:integer*">
    <!-- Accepts hexstrings of arbitrary length as argument (only integer precision is the limit) 
         Also can take a sequence of hex strings. Then will return a sequence of integers. -->
    <xsl:param name="hex" as="xs:string*"/>
    <xsl:for-each select="$hex">
      <xsl:variable name="hexLength" select="string-length()"/>
      <!-- "string-length(substring-before(..))" gets us the value of the byte -->
      <xsl:sequence select="string-length(substring-before('0123456789ABCDEF',
        upper-case(substring(.,$hexLength,1)) (: this returns the last (lowest) byte :) ))
        (: Now we look for higher bytes and add them, if present :) + (if($hexLength gt 1)
        then 16 * f:hex2integer(substring(.,1,$hexLength - 1)) (: recurse, stripping last (lowest)
        byte :) else 0)"/>
    </xsl:for-each>
  </xsl:function>

  <!-- Named templates -->
  <!-- aarrggbb2css provided by Thomas Weber -->
  <xsl:template name="aarrggbb2css" as="xs:string">
    <!-- Expects parameter of form '#aarrggbb' -->
    <xsl:param name="aarrggbb" as="xs:string"/>
    <xsl:value-of select="('rgba(', for $startByte in (4,6,8) (: Red, green and blue start at
      byte 4, 6 and 8 :) return concat( (: In each iteration, :)
      f:hex2integer(substring($aarrggbb,$startByte,2)), (: ... return the decimal value :) ','
      (: ... and a trailing comma :)  ), f:hex2integer(substring($aarrggbb,2,2)) div 255, (:
      alpha value is between 0 and 1 => divide by 255 :) ')' )" separator=""/>
  </xsl:template>

  <xsl:template name="accidentals">
    <!-- Accidentals in elements so that exact placement can be recorded -->
    <xsl:for-each select="accidental">
      <xsl:variable name="thisAccid">
        <xsl:value-of select="normalize-space(.)"/>
      </xsl:variable>
      <accid xmlns="http://www.music-encoding.org/ns/mei">
        <xsl:choose>
          <xsl:when test="@editorial='yes'">
            <xsl:attribute name="func">edit</xsl:attribute>
          </xsl:when>
          <xsl:when test="@cautionary='yes'">
            <xsl:attribute name="func">caution</xsl:attribute>
          </xsl:when>
        </xsl:choose>
        <xsl:choose>
          <xsl:when test="@parentheses='yes'">
            <xsl:attribute name="enclose">paren</xsl:attribute>
          </xsl:when>
          <xsl:when test="@bracket='yes'">
            <xsl:attribute name="enclose">brack</xsl:attribute>
          </xsl:when>
        </xsl:choose>
        <xsl:attribute name="accid">
          <xsl:choose>
            <xsl:when test="$thisAccid = 'sharp'">s</xsl:when>
            <xsl:when test="$thisAccid = 'natural'">n</xsl:when>
            <xsl:when test="$thisAccid = 'flat'">f</xsl:when>
            <xsl:when test="$thisAccid = 'double-sharp'">x</xsl:when>
            <xsl:when test="$thisAccid = 'sharp-sharp'">ss</xsl:when>
            <xsl:when test="$thisAccid = 'flat-flat'">ff</xsl:when>
            <xsl:when test="$thisAccid = 'natural-sharp'">ns</xsl:when>
            <xsl:when test="$thisAccid = 'natural-flat'">nf</xsl:when>
            <xsl:when test="$thisAccid = 'quarter-flat'">fd</xsl:when>
            <xsl:when test="$thisAccid = 'quarter-sharp'">su</xsl:when>
          </xsl:choose>
        </xsl:attribute>
        <xsl:call-template name="positionRelative"/>
        <!-- Accid element must allow rend in order to use fontproperties
        <xsl:call-template name="fontproperties"/> -->
      </accid>
    </xsl:for-each>
  </xsl:template>

  <xsl:template name="artics">
    <!-- This template populates the artic attribute on note.  Use the articulations
    template for artic sub-elements. -->
    <xsl:variable name="articlist">
      <xsl:for-each select="notations/articulations/*">
        <xsl:choose>
          <!-- General use articulations -->
          <xsl:when test="name()='accent'">
            <xsl:text>acc</xsl:text>
          </xsl:when>
          <xsl:when test="name()='strong-accent'">
            <xsl:text>marc</xsl:text>
          </xsl:when>
          <xsl:when test="name()='staccato'">
            <xsl:text>stacc</xsl:text>
          </xsl:when>
          <xsl:when test="name()='tenuto'">
            <xsl:text>ten</xsl:text>
          </xsl:when>
          <xsl:when test="name()='detached-legato'">
            <xsl:text>ten-stacc</xsl:text>
          </xsl:when>
          <xsl:when test="name()='staccatissimo'">
            <xsl:text>stacciss</xsl:text>
          </xsl:when>
          <!-- String articulations -->
          <xsl:when test="name()='spiccato'">
            <xsl:text>spicc</xsl:text>
          </xsl:when>
          <!-- Jazz articulations -->
          <xsl:when test="name()='scoop'">
            <xsl:text>rip</xsl:text>
          </xsl:when>
          <xsl:when test="name()='plop'">
            <xsl:text>plop</xsl:text>
          </xsl:when>
          <xsl:when test="name()='doit'">
            <xsl:text>doit</xsl:text>
          </xsl:when>
          <xsl:when test="name()='falloff'">
            <xsl:text>fall</xsl:text>
          </xsl:when>
          <xsl:when test="name()='caesura'">
            <!-- This is a no-op. In MEI a caesura is a control element, not a note
                 articulation and is processed along with other control elements in
                 the measure template. -->
          </xsl:when>
        </xsl:choose>
        <xsl:text>&#32;</xsl:text>
      </xsl:for-each>
      <xsl:for-each select="notations/technical/*">
        <xsl:choose>
          <!-- String articulations -->
          <xsl:when test="name()='up-bow'">
            <xsl:text>upbow</xsl:text>
          </xsl:when>
          <xsl:when test="name()='down-bow'">
            <xsl:text>dnbow</xsl:text>
          </xsl:when>
          <xsl:when test="name()='harmonic'">
            <xsl:text>harm</xsl:text>
          </xsl:when>
          <xsl:when test="name()='open-string'">
            <xsl:text>open</xsl:text>
          </xsl:when>
          <xsl:when test="name()='snap-pizzicato'">
            <xsl:text>snap</xsl:text>
          </xsl:when>
          <xsl:when test="name()='tap'">
            <xsl:text>tap</xsl:text>
          </xsl:when>
          <xsl:when test="name()='pluck'">
            <xsl:text>lhpizz</xsl:text>
          </xsl:when>
          <!-- Wind articulations -->
          <xsl:when test="name()='double-tongue'">
            <xsl:text>dbltongue</xsl:text>
          </xsl:when>
          <xsl:when test="name()='triple-tongue'">
            <xsl:text>trpltongue</xsl:text>
          </xsl:when>
          <xsl:when test="name()='stopped'">
            <xsl:text>stop</xsl:text>
          </xsl:when>
          <xsl:when test="name()='bend'">
            <xsl:text>bend</xsl:text>
          </xsl:when>
          <!-- Keyboard/organ articulations -->
          <xsl:when test="name()='heel'">
            <xsl:text>heel</xsl:text>
          </xsl:when>
          <xsl:when test="name()='toe'">
            <xsl:text>toe</xsl:text>
          </xsl:when>
          <xsl:when test="name()='fingernails'">
            <xsl:text>fingernail</xsl:text>
          </xsl:when>
        </xsl:choose>
        <xsl:text>&#32;</xsl:text>
      </xsl:for-each>
    </xsl:variable>
    <xsl:if test="normalize-space($articlist) != ''">
      <xsl:attribute name="artic">
        <xsl:value-of select="normalize-space($articlist)"/>
      </xsl:attribute>
    </xsl:if>
  </xsl:template>

  <xsl:template name="articulations">
    <!-- This template creates artic sub-elements so that placement of the articulations
    can be recorded. -->
    <xsl:for-each select="notations/articulations/*">
      <artic xmlns="http://www.music-encoding.org/ns/mei">
        <xsl:choose>
          <xsl:when test="name()='accent'">
            <xsl:attribute name="artic">acc</xsl:attribute>
            <xsl:if test="@placement != ''">
              <xsl:attribute name="place">
                <xsl:value-of select="@placement"/>
              </xsl:attribute>
            </xsl:if>
          </xsl:when>
          <xsl:when test="name()='strong-accent'">
            <xsl:attribute name="artic">marc</xsl:attribute>
            <xsl:if test="@placement != ''">
              <xsl:attribute name="place">
                <xsl:value-of select="@placement"/>
              </xsl:attribute>
            </xsl:if>
          </xsl:when>
          <xsl:when test="name()='staccato'">
            <xsl:attribute name="artic">stacc</xsl:attribute>
            <xsl:if test="@placement != ''">
              <xsl:attribute name="place">
                <xsl:value-of select="@placement"/>
              </xsl:attribute>
            </xsl:if>
          </xsl:when>
          <xsl:when test="name()='tenuto'">
            <xsl:attribute name="artic">ten</xsl:attribute>
            <xsl:if test="@placement != ''">
              <xsl:attribute name="place">
                <xsl:value-of select="@placement"/>
              </xsl:attribute>
            </xsl:if>
          </xsl:when>
          <xsl:when test="name()='detached-legato'">
            <xsl:attribute name="artic">ten-stacc</xsl:attribute>
            <xsl:if test="@placement != ''">
              <xsl:attribute name="place">
                <xsl:value-of select="@placement"/>
              </xsl:attribute>
            </xsl:if>
          </xsl:when>
          <xsl:when test="name()='staccatissimo'">
            <xsl:attribute name="artic">stacciss</xsl:attribute>
            <xsl:if test="@placement != ''">
              <xsl:attribute name="place">
                <xsl:value-of select="@placement"/>
              </xsl:attribute>
            </xsl:if>
          </xsl:when>
        </xsl:choose>
        <xsl:call-template name="positionRelative"/>
        <!-- The artic element must allow rend in order to use fontproperties -->
        <!-- <xsl:call-template name="fontproperties"/> -->
      </artic>
    </xsl:for-each>

    <xsl:for-each select="notations/technical/*[not(name()='string' or name()='fret' or
      name()='pull-off')]">
      <!-- Tests for string and jazz articulations and for notation/technical elements
      other than tab string and fret indications and pull-offs which are handled elsewhere.
      What about hammer-ons? -->
      <artic xmlns="http://www.music-encoding.org/ns/mei">
        <xsl:choose>
          <xsl:when test="name()='up-bow'">
            <xsl:attribute name="artic">upbow</xsl:attribute>
            <xsl:if test="@placement != ''">
              <xsl:attribute name="place">
                <xsl:value-of select="@placement"/>
              </xsl:attribute>
            </xsl:if>
          </xsl:when>
          <xsl:when test="name()='down-bow'">
            <xsl:attribute name="artic">dnbow</xsl:attribute>
            <xsl:if test="@placement != ''">
              <xsl:attribute name="place">
                <xsl:value-of select="@placement"/>
              </xsl:attribute>
            </xsl:if>
          </xsl:when>
          <xsl:when test="name()='harmonic'">
            <xsl:attribute name="artic">harm</xsl:attribute>
            <xsl:if test="@placement != ''">
              <xsl:attribute name="place">
                <xsl:value-of select="@placement"/>
              </xsl:attribute>
            </xsl:if>
          </xsl:when>
          <xsl:when test="name()='open-string'">
            <xsl:attribute name="artic">open</xsl:attribute>
            <xsl:if test="@placement != ''">
              <xsl:attribute name="place">
                <xsl:value-of select="@placement"/>
              </xsl:attribute>
            </xsl:if>
          </xsl:when>
          <xsl:when test="name()='snap-pizzicato'">
            <xsl:attribute name="artic">snap</xsl:attribute>
            <xsl:if test="@placement != ''">
              <xsl:attribute name="place">
                <xsl:value-of select="@placement"/>
              </xsl:attribute>
            </xsl:if>
          </xsl:when>
          <xsl:when test="name()='tap'">
            <xsl:attribute name="artic">tap</xsl:attribute>
            <xsl:if test="@placement != ''">
              <xsl:attribute name="place">
                <xsl:value-of select="@placement"/>
              </xsl:attribute>
            </xsl:if>
          </xsl:when>
          <xsl:when test="name()='pluck'">
            <xsl:attribute name="artic">lhpizz</xsl:attribute>
            <xsl:if test="@placement != ''">
              <xsl:attribute name="place">
                <xsl:value-of select="@placement"/>
              </xsl:attribute>
            </xsl:if>
          </xsl:when>
          <xsl:when test="name()='double-tongue'">
            <xsl:attribute name="artic">dbltongue</xsl:attribute>
            <xsl:if test="@placement != ''">
              <xsl:attribute name="place">
                <xsl:value-of select="@placement"/>
              </xsl:attribute>
            </xsl:if>
          </xsl:when>
          <xsl:when test="name()='triple-tongue'">
            <xsl:attribute name="artic">trpltongue</xsl:attribute>
            <xsl:if test="@placement != ''">
              <xsl:attribute name="place">
                <xsl:value-of select="@placement"/>
              </xsl:attribute>
            </xsl:if>
          </xsl:when>
          <xsl:when test="name()='stopped'">
            <xsl:attribute name="artic">stop</xsl:attribute>
            <xsl:if test="@placement != ''">
              <xsl:attribute name="place">
                <xsl:value-of select="@placement"/>
              </xsl:attribute>
            </xsl:if>
          </xsl:when>
          <xsl:when test="name()='bend'">
            <xsl:attribute name="artic">bend</xsl:attribute>
            <xsl:if test="@placement != ''">
              <xsl:attribute name="place">
                <xsl:value-of select="@placement"/>
              </xsl:attribute>
            </xsl:if>
          </xsl:when>
          <xsl:when test="name()='heel'">
            <xsl:attribute name="artic">heel</xsl:attribute>
            <xsl:if test="@placement != ''">
              <xsl:attribute name="place">
                <xsl:value-of select="@placement"/>
              </xsl:attribute>
            </xsl:if>
          </xsl:when>
          <xsl:when test="name()='toe'">
            <xsl:attribute name="artic">toe</xsl:attribute>
            <xsl:if test="@placement != ''">
              <xsl:attribute name="place">
                <xsl:value-of select="@placement"/>
              </xsl:attribute>
            </xsl:if>
          </xsl:when>
          <xsl:when test="name()='fingernails'">
            <xsl:attribute name="artic">fingernail</xsl:attribute>
            <xsl:if test="@placement != ''">
              <xsl:attribute name="place">
                <xsl:value-of select="@placement"/>
              </xsl:attribute>
            </xsl:if>
          </xsl:when>
        </xsl:choose>
        <xsl:call-template name="positionRelative"/>
        <!-- The artic element must allow rend in order to use fontproperties -->
        <!-- <xsl:call-template name="fontproperties"/> -->
      </artic>
    </xsl:for-each>
  </xsl:template>

  <xsl:template name="assignPart-Layer-Staff-Beam-Tuplet">
    <xsl:variable name="partID">
      <xsl:value-of select="ancestor::part[1]/@id"/>
    </xsl:variable>

    <!-- Part assignment -->
    <xsl:attribute name="part">
      <xsl:value-of select="$partID"/>
    </xsl:attribute>

    <!-- Staff assignment -->
    <xsl:variable name="partStaff">
      <xsl:choose>
        <xsl:when test="staff">
          <xsl:value-of select="staff"/>
        </xsl:when>
        <xsl:otherwise>1</xsl:otherwise>
      </xsl:choose>
    </xsl:variable>
    <xsl:attribute name="staff">
      <xsl:call-template name="getStaffNum">
        <xsl:with-param name="partID">
          <xsl:value-of select="$partID"/>
        </xsl:with-param>
        <xsl:with-param name="partStaff">
          <xsl:value-of select="$partStaff"/>
        </xsl:with-param>
      </xsl:call-template>
    </xsl:attribute>

    <!-- Layer (voice) assignment -->
    <!-- This is a voice within a part, not a layer on a staff as in MEI. -->
    <xsl:variable name="thisVoice">
      <xsl:choose>
        <xsl:when test="voice">
          <xsl:value-of select="voice"/>
        </xsl:when>
        <xsl:otherwise>1</xsl:otherwise>
      </xsl:choose>
    </xsl:variable>
    <xsl:attribute name="layer">
      <xsl:value-of select="$thisVoice"/>
    </xsl:attribute>

    <!-- Beam assignment -->
    <!-- MEI only records the start, continuation, and end of the primary beam -->
    <xsl:choose>
      <xsl:when test="beam[@number='1']='begin'">
        <xsl:variable name="beamLevel">
          <xsl:value-of select="(count(preceding-sibling::*[beam[@number='1']='begin' and
            voice=$thisVoice]) + 1) - count(preceding-sibling::*[beam[@number='1']='end' and
            voice=$thisVoice])"/>
        </xsl:variable>
        <xsl:attribute name="beam">
          <xsl:text>i</xsl:text>
          <xsl:value-of select="$beamLevel"/>
        </xsl:attribute>
      </xsl:when>
      <xsl:when test="beam[@number ='1']='continue'">
        <xsl:variable name="beamLevel">
          <xsl:value-of select="count(preceding-sibling::*[beam[@number='1']='begin' and
            voice=$thisVoice]) - count(preceding-sibling::*[beam[@number='1']='end' and
            voice=$thisVoice])"/>
        </xsl:variable>
        <xsl:attribute name="beam">
          <xsl:text>m</xsl:text>
          <xsl:value-of select="$beamLevel"/>
        </xsl:attribute>
      </xsl:when>
      <xsl:when test="beam[@number='1']='end'">
        <xsl:variable name="beamLevel">
          <xsl:value-of select="count(preceding-sibling::*[beam[@number='1']='begin' and
            voice=$thisVoice]) - count(preceding-sibling::*[beam[@number='1']='end' and
            voice=$thisVoice])"/>
        </xsl:variable>
        <xsl:attribute name="beam">
          <xsl:text>t</xsl:text>
          <xsl:value-of select="$beamLevel"/>
        </xsl:attribute>
      </xsl:when>
      <xsl:when test="rest and (preceding-sibling::*[beam][1]/beam='begin' or
        preceding-sibling::*[beam][1]/beam='continue') and
        (following-sibling::*[beam][1]/beam='end' or following-sibling::*[beam][1]/beam='continue')">
        <!-- In MusicXML rests under a beam do not have a 'continue' beam element so this data has to be supplied. -->
        <xsl:if test="preceding-sibling::*[beam][1]/voice=$thisVoice and
          following-sibling::*[beam][1]/voice=$thisVoice">
          <xsl:variable name="beamLevel">
            <xsl:value-of select="count(preceding-sibling::*[beam[@number='1']='begin' and
              voice=$thisVoice]) - count(preceding-sibling::*[beam[@number='1']='end' and
              voice=$thisVoice])"/>
          </xsl:variable>
          <xsl:attribute name="beam">
            <xsl:text>m</xsl:text>
            <xsl:value-of select="$beamLevel"/>
          </xsl:attribute>
        </xsl:if>
      </xsl:when>
    </xsl:choose>

    <!-- Tuplet attribute -->
    <xsl:if test="notations/tuplet or time-modification">
      <xsl:attribute name="tuplet">
        <xsl:choose>
          <xsl:when test="notations/tuplet[@type='start']">
            <xsl:text>i</xsl:text>
            <xsl:choose>
              <xsl:when test="notations/tuplet/@number">
                <xsl:value-of select="notations/tuplet/@number"/>
              </xsl:when>
              <xsl:otherwise>1</xsl:otherwise>
            </xsl:choose>
          </xsl:when>
          <xsl:when test="notations/tuplet[@type='stop']">
            <xsl:text>t</xsl:text>
            <xsl:choose>
              <xsl:when test="notations/tuplet/@number">
                <xsl:value-of select="notations/tuplet/@number"/>
              </xsl:when>
              <xsl:otherwise>1</xsl:otherwise>
            </xsl:choose>
          </xsl:when>
          <xsl:otherwise>
            <!-- MusicXML doesn't have a tuplet of type 'continue' -->
            <xsl:text>m</xsl:text>
            <xsl:choose>
              <xsl:when test="preceding::note[notations/tuplet][1]/notations/tuplet/@number">
                <xsl:value-of select="preceding::note[notations/tuplet][1]/notations/tuplet/@number"
                />
              </xsl:when>
              <xsl:otherwise>1</xsl:otherwise>
            </xsl:choose>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:attribute>
    </xsl:if>
  </xsl:template>

  <xsl:template match="credit-words[@default-y]">
    <anchoredText xmlns="http://www.music-encoding.org/ns/mei">
      <xsl:if test="../credit-type">
        <xsl:attribute name="n" select="replace(normalize-space(../credit-type), '\s', '_')"/>
      </xsl:if>
      <xsl:attribute name="x">
        <xsl:value-of select="format-number(@default-x div 5, '###0.########')"/>
      </xsl:attribute>
      <xsl:attribute name="y">
        <xsl:value-of select="format-number(@default-y div 5, '###0.########')"/>
      </xsl:attribute>
      <xsl:variable name="content">
        <xsl:choose>
          <xsl:when test="matches(../credit-type, '^page number$') or matches(../credit-type,
            '^[0-9]+$')">
            <xsl:processing-instruction name="pageNum"/>
          </xsl:when>
          <xsl:otherwise>
            <xsl:value-of select="normalize-space(.)"/>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:variable>
      <xsl:choose>
        <xsl:when test="@font-family | @font-style | @font-size | @font-weight | @letter-spacing |
          @line-height | @justify | @halign | @valign | @color | @rotation | @xml:space |
          @underline | @overline | @line-through | @dir | @enclosure">
          <xsl:call-template name="wrapRend">
            <xsl:with-param name="in">
              <xsl:copy-of select="$content"/>
            </xsl:with-param>
          </xsl:call-template>
        </xsl:when>
        <xsl:otherwise>
          <xsl:copy-of select="$content"/>
        </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="following-sibling::credit-words[not(@default-y)]"/>
    </anchoredText>
  </xsl:template>

  <xsl:template match="credit-words[not(@default-y)]">
    <lb xmlns="http://www.music-encoding.org/ns/mei"/>
    <xsl:variable name="content">
      <xsl:choose>
        <xsl:when test="matches(../credit-type, '^page number$') or matches(../credit-type,
          '^[0-9]+$')">
          <xsl:processing-instruction name="pageNum"/>
        </xsl:when>
        <xsl:otherwise>
          <xsl:value-of select="normalize-space(.)"/>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:variable>
    <xsl:choose>
      <xsl:when test="@font-family | @font-style | @font-size | @font-weight | @letter-spacing |
        @line-height | @justify | @halign | @valign | @color | @rotation | @xml:space |
        @underline | @overline | @line-through | @dir | @enclosure">
        <xsl:call-template name="wrapRend">
          <xsl:with-param name="in">
            <xsl:copy-of select="$content"/>
          </xsl:with-param>
        </xsl:call-template>
      </xsl:when>
      <xsl:otherwise>
        <xsl:copy-of select="$content"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template name="credits">
    <xsl:variable name="pageHeight">
      <xsl:value-of select="defaults/page-layout/page-height"/>
    </xsl:variable>
    <xsl:variable name="credits">
      <xsl:if test="credit[number(@page)=1]/credit-words[@default-y &gt; ($pageHeight div 2)]">
        <pgHead xmlns="http://www.music-encoding.org/ns/mei">
          <xsl:for-each select="credit[number(@page)=1]/credit-words[@default-y &gt; ($pageHeight
            div 2)]">
            <xsl:apply-templates select="."/>
            <!--<xsl:call-template name="creditWords"/>-->
          </xsl:for-each>
        </pgHead>
      </xsl:if>
      <xsl:if test="credit[number(@page)=1]/credit-words[@default-y &lt; ($pageHeight div 2)]">
        <pgFoot xmlns="http://www.music-encoding.org/ns/mei">
          <xsl:for-each select="credit[number(@page)=1]/credit-words[@default-y &lt; ($pageHeight
            div 2)]">
            <xsl:apply-templates select="."/>
            <!--<xsl:call-template name="creditWords"/>-->
          </xsl:for-each>
        </pgFoot>
      </xsl:if>
      <xsl:if test="credit[number(@page)=2]/credit-words[@default-y &gt; ($pageHeight div 2)]">
        <pgHead2 xmlns="http://www.music-encoding.org/ns/mei">
          <xsl:for-each select="credit[number(@page)=2]/credit-words[@default-y &gt; ($pageHeight
            div 2)]">
            <xsl:apply-templates select="."/>
            <!--<xsl:call-template name="creditWords"/>-->
          </xsl:for-each>
        </pgHead2>
      </xsl:if>
      <xsl:if test="credit[number(@page)=2]/credit-words[@default-y &lt; ($pageHeight div 2)]">
        <pgFoot2 xmlns="http://www.music-encoding.org/ns/mei">
          <xsl:for-each select="credit[number(@page)=2]/credit-words[@default-y &lt; ($pageHeight
            div 2)]">
            <xsl:apply-templates select="."/>
            <!--<xsl:call-template name="creditWords"/>-->
          </xsl:for-each>
        </pgFoot2>
      </xsl:if>
    </xsl:variable>
    <xsl:copy-of select="$credits/mei:pgHead"/>
    <xsl:copy-of select="$credits/mei:pgHead2"/>
    <xsl:copy-of select="$credits/mei:pgFoot"/>
    <xsl:copy-of select="$credits/mei:pgFoot2"/>
  </xsl:template>

  <xsl:template name="dirBasicAttrs">
    <xsl:variable name="tstampGestural">
      <xsl:for-each select="ancestor::direction[1]">
        <xsl:call-template name="getTimestamp.ges"/>
      </xsl:for-each>
    </xsl:variable>
    <xsl:attribute name="tstamp">
      <xsl:call-template name="tstamp.ges2beat">
        <xsl:with-param name="tstamp.ges">
          <xsl:choose>
            <!-- Using offset until it can be determined how to use @default-x -->
            <xsl:when test="number(ancestor::direction[1]/offset)">
              <xsl:value-of select="format-number(number($tstampGestural) +
                number(ancestor::direction[1]/offset), '###0.########')"/>
            </xsl:when>
            <!--<xsl:when test="number(ancestor::direction[1]/offset) and
              not(ancestor::direction[1]/direction-type/dynamics/@default-x)">
              <xsl:value-of select="number($tstampGestural) + number(ancestor::direction[1]/offset)"
              />
            </xsl:when>-->
            <xsl:otherwise>
              <xsl:value-of select="format-number(number($tstampGestural), '###0.########')"/>
            </xsl:otherwise>
          </xsl:choose>
        </xsl:with-param>
      </xsl:call-template>
    </xsl:attribute>
    <xsl:attribute name="tstamp.ges">
      <xsl:choose>
        <xsl:when test="number(ancestor::direction[1]/offset[@sound='yes'])">
          <xsl:value-of select="$tstampGestural +
            number(ancestor::direction[1]/offset[@sound='yes'])"/>
        </xsl:when>
        <xsl:otherwise>
          <xsl:value-of select="$tstampGestural"/>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:attribute>
    <xsl:variable name="partID">
      <xsl:value-of select="ancestor::part[1]/@id"/>
    </xsl:variable>
    <xsl:variable name="partStaff">
      <xsl:choose>
        <xsl:when test="ancestor::direction[1]/staff">
          <xsl:value-of select="ancestor::direction[1]/staff"/>
        </xsl:when>
        <xsl:otherwise>1</xsl:otherwise>
      </xsl:choose>
    </xsl:variable>
    <xsl:attribute name="staff">
      <xsl:call-template name="getStaffNum">
        <xsl:with-param name="partID">
          <xsl:value-of select="$partID"/>
        </xsl:with-param>
        <xsl:with-param name="partStaff">
          <xsl:value-of select="$partStaff"/>
        </xsl:with-param>
      </xsl:call-template>
    </xsl:attribute>

  </xsl:template>

  <xsl:template name="fermata">
    <!-- Is there a fermata? -->
    <xsl:for-each select="notations/fermata[1]">
      <xsl:choose>
        <xsl:when test="@type='upright'">
          <xsl:attribute name="fermata">above</xsl:attribute>
        </xsl:when>
        <xsl:when test="@type='inverted'">
          <xsl:attribute name="fermata">below</xsl:attribute>
        </xsl:when>
      </xsl:choose>
    </xsl:for-each>
  </xsl:template>

  <xsl:template name="gesturalDuration">
    <!-- Gestural duration -->
    <xsl:attribute name="dur.ges">
      <xsl:choose>
        <xsl:when test="grace">
          <xsl:text>0</xsl:text>
        </xsl:when>
        <xsl:otherwise>
          <xsl:value-of select="duration"/>
        </xsl:otherwise>
      </xsl:choose>
      <xsl:text>p</xsl:text>
    </xsl:attribute>
  </xsl:template>

  <xsl:template name="getStaffNum">
    <!-- Assign a staff number from $defaultLayout -->
    <xsl:param name="partID">P1</xsl:param>
    <xsl:param name="partStaff">1</xsl:param>
    <xsl:choose>
      <xsl:when test="local-name($defaultLayout//*[@xml:id=$partID])='staffDef'">
        <xsl:value-of select="$defaultLayout//*[@xml:id=$partID]/@n"/>
      </xsl:when>
      <xsl:when test="local-name($defaultLayout//*[@xml:id=$partID])='staffGrp'">
        <xsl:value-of
          select="$defaultLayout//*[@xml:id=$partID]//mei:staffDef[position()=$partStaff]/@n"/>
      </xsl:when>
    </xsl:choose>
  </xsl:template>

  <xsl:template name="getTimestamp.ges">
    <!-- Assign a timestamp. -->
    <xsl:variable name="durSum">
      <xsl:choose>
        <xsl:when test="local-name(.)='clef'">
          <xsl:value-of select="sum(../preceding-sibling::note[not(chord)]/duration) +
            sum(../preceding-sibling::forward/duration) -
            sum(../preceding-sibling::backup/duration)"/>
        </xsl:when>
        <xsl:otherwise>
          <xsl:value-of select="sum(preceding-sibling::note[not(chord)]/duration) +
            sum(preceding-sibling::forward/duration) - sum(preceding-sibling::backup/duration)"/>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:variable>
    <!--<xsl:value-of select="round-half-to-even($durSum,3)"/>-->
    <xsl:value-of select="format-number($durSum, '###0.########')"/>
  </xsl:template>

  <xsl:template name="greatestCommonDenominator">
    <xsl:param name="a"/>
    <xsl:param name="b"/>
    <xsl:variable name="min">
      <xsl:value-of select="min(($a, $b))"/>
    </xsl:variable>
    <xsl:variable name="max">
      <xsl:value-of select="max(($a, $b))"/>
    </xsl:variable>
    <xsl:variable name="x">
      <xsl:value-of select="$max - $min"/>
    </xsl:variable>
    <xsl:choose>
      <xsl:when test="$x = $min">
        <xsl:value-of select="$x"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:call-template name="greatestCommonDenominator">
          <xsl:with-param name="a">
            <xsl:value-of select="$min"/>
          </xsl:with-param>
          <xsl:with-param name="b">
            <xsl:value-of select="$x"/>
          </xsl:with-param>
        </xsl:call-template>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template name="leastCommonMultiple">
    <xsl:param name="in"/>
    <xsl:choose>
      <xsl:when test="count($in//divisions) &gt; 2">
        <xsl:variable name="out">
          <xsl:for-each select="$in//divisions[position() &lt; last()]">
            <xsl:variable name="a">
              <xsl:value-of select="."/>
            </xsl:variable>
            <xsl:variable name="b">
              <xsl:value-of select="following-sibling::divisions[1]"/>
            </xsl:variable>
            <xsl:variable name="y">
              <xsl:call-template name="greatestCommonDenominator">
                <xsl:with-param name="a">
                  <xsl:value-of select="$a"/>
                </xsl:with-param>
                <xsl:with-param name="b">
                  <xsl:value-of select="$b"/>
                </xsl:with-param>
              </xsl:call-template>
            </xsl:variable>
            <divisions>
              <xsl:value-of select="($a * $b) div $y"/>
            </divisions>
          </xsl:for-each>
        </xsl:variable>
        <xsl:call-template name="leastCommonMultiple">
          <xsl:with-param name="in">
            <xsl:copy-of select="$out"/>
          </xsl:with-param>
        </xsl:call-template>
      </xsl:when>
      <xsl:otherwise>
        <xsl:variable name="a">
          <xsl:value-of select="$in//divisions[1]"/>
        </xsl:variable>
        <xsl:variable name="b">
          <xsl:value-of select="$in//divisions[2]"/>
        </xsl:variable>
        <xsl:variable name="y">
          <xsl:call-template name="greatestCommonDenominator">
            <xsl:with-param name="a">
              <xsl:value-of select="$a"/>
            </xsl:with-param>
            <xsl:with-param name="b">
              <xsl:value-of select="$b"/>
            </xsl:with-param>
          </xsl:call-template>
        </xsl:variable>
        <xsl:value-of select="($a * $b) div $y"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template name="makeStaff">
    <!-- This template is called recursively to create the desired number
      of staves for a part. -->
    <xsl:param name="partID"/>
    <xsl:param name="needed">1</xsl:param>
    <xsl:param name="made">0</xsl:param>
    <xsl:if test="$made &lt; $needed">
      <staffDef xmlns="http://www.music-encoding.org/ns/mei">
        <xsl:call-template name="staffInitialAttributes">
          <xsl:with-param name="partID">
            <xsl:value-of select="$partID"/>
          </xsl:with-param>
          <xsl:with-param name="staffNum">
            <xsl:value-of select="string($made + 1)"/>
          </xsl:with-param>
        </xsl:call-template>
      </staffDef>
      <xsl:call-template name="makeStaff">
        <xsl:with-param name="partID">
          <xsl:value-of select="$partID"/>
        </xsl:with-param>
        <xsl:with-param name="needed">
          <xsl:value-of select="$needed"/>
        </xsl:with-param>
        <xsl:with-param name="made">
          <xsl:value-of select="$made + 1"/>
        </xsl:with-param>
      </xsl:call-template>
    </xsl:if>
  </xsl:template>

  <xsl:template name="measureDuration">
    <!-- Calculate duration of a measure in ppq -->
    <xsl:param name="meterCount"/>
    <xsl:param name="meterUnit"/>
    <xsl:param name="ppq"/>
    <!--DEBUG:-->
    <!--<xsl:variable name="errorMessage">
      <xsl:text>m. </xsl:text>
      <xsl:value-of select="ancestor::measure/@number"/>
      <xsl:text>, part </xsl:text>
      <xsl:value-of select="ancestor::part/@id"/>
      <xsl:text>: meterCount=</xsl:text>
      <xsl:value-of select="$meterCount"/>
      <xsl:text>, meterUnit=</xsl:text>
      <xsl:value-of select="$meterUnit"/>
      <xsl:text>, ppq=</xsl:text>
      <xsl:value-of select="$ppq"/>
    </xsl:variable>
    <xsl:message>
      <xsl:value-of select="$errorMessage"/>
    </xsl:message>-->
    <xsl:choose>
      <xsl:when test="$meterUnit = 1">
        <xsl:value-of select="($meterCount * 4) * $ppq"/>
      </xsl:when>
      <xsl:when test="$meterUnit = 2">
        <xsl:value-of select="($meterCount * $meterUnit) * $ppq"/>
      </xsl:when>
      <xsl:when test="$meterUnit = 4">
        <xsl:value-of select="$meterCount * $ppq"/>
      </xsl:when>
      <xsl:when test="$meterUnit &gt; 4">
        <xsl:value-of select="($meterCount div ($meterUnit div 4)) * $ppq"/>
      </xsl:when>
    </xsl:choose>
  </xsl:template>

  <xsl:template name="notatedDot">
    <!-- Notated dotted values -->
    <xsl:if test="dot">
      <xsl:attribute name="dots">
        <xsl:value-of select="count(dot)"/>
      </xsl:attribute>
    </xsl:if>
  </xsl:template>

  <xsl:template name="notatedDuration">
    <!-- Notated duration derived from type element -->
    <xsl:choose>
      <xsl:when test="normalize-space(.) = 'long'">
        <xsl:text>long</xsl:text>
      </xsl:when>
      <xsl:when test="normalize-space(.) = 'breve'">
        <xsl:text>breve</xsl:text>
      </xsl:when>
      <xsl:when test="normalize-space(.) = 'whole'">
        <xsl:text>1</xsl:text>
      </xsl:when>
      <xsl:when test="normalize-space(.) = 'half'">
        <xsl:text>2</xsl:text>
      </xsl:when>
      <xsl:when test="normalize-space(.) = 'quarter'">
        <xsl:text>4</xsl:text>
      </xsl:when>
      <xsl:when test="normalize-space(.) = 'eighth'">
        <xsl:text>8</xsl:text>
      </xsl:when>
      <xsl:otherwise>
        <xsl:analyze-string select="normalize-space(.)" regex="^([0-9]+)(.*)$">
          <xsl:matching-substring>
            <xsl:value-of select="regex-group(1)"/>
          </xsl:matching-substring>
        </xsl:analyze-string>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template name="notatedDurationUnicode">
    <!-- Notated duration derived from type element -->
    <xsl:choose>
      <!-- No Unicode equivalent -->
      <!--<xsl:when test="normalize-space(.) = 'long'">
        <xsl:text>long</xsl:text>
      </xsl:when>-->
      <xsl:when test="normalize-space(.) = 'breve'">
        <!--<xsl:text>&#x1D15C;</xsl:text>-->
        <xsl:comment>[breve]</xsl:comment>
      </xsl:when>
      <xsl:when test="normalize-space(.) = 'whole'">
        <!--<xsl:text>&#x1D15D;</xsl:text>-->
        <xsl:comment>[whole]</xsl:comment>
      </xsl:when>
      <xsl:when test="normalize-space(.) = 'half'">
        <!--<xsl:text>&#x1D15E;</xsl:text>-->
        <xsl:comment>[half]</xsl:comment>
      </xsl:when>
      <xsl:when test="normalize-space(.) = 'quarter'">
        <!--<xsl:text>&#x1D15F;</xsl:text>-->
        <xsl:comment>[quarter]</xsl:comment>
      </xsl:when>
      <xsl:when test="normalize-space(.) = 'eighth'">
        <!--<xsl:text>&#x1D160;</xsl:text>-->
        <xsl:comment>[8th]</xsl:comment>
      </xsl:when>
      <xsl:when test="normalize-space(.) = '16'">
        <!--<xsl:text>&#x1D161;</xsl:text>-->
        <xsl:comment>[16th]</xsl:comment>
      </xsl:when>
      <xsl:when test="normalize-space(.) = '32'">
        <!-- <xsl:text>&#x1D162;</xsl:text>-->
        <xsl:comment>[32nd]</xsl:comment>
      </xsl:when>
      <xsl:when test="normalize-space(.) = '64'">
        <!--<xsl:text>&#x1D163;</xsl:text>-->
        <xsl:comment>[64th]</xsl:comment>
      </xsl:when>
      <xsl:when test="normalize-space(.) = '128'">
        <!--<xsl:text>&#x1D164;</xsl:text>-->
        <xsl:comment>[128th]</xsl:comment>
      </xsl:when>
    </xsl:choose>
  </xsl:template>

  <xsl:template name="quantizedDuration">
    <xsl:param name="ppq"/>
    <xsl:param name="duration"/>
    <!-- Build lookup table -->
    <!-- undotted values -->
    <xsl:variable name="clicks4">
      <xsl:value-of select="$ppq"/>
    </xsl:variable>
    <xsl:variable name="clicks1">
      <xsl:value-of select="$clicks4 * 4"/>
    </xsl:variable>
    <xsl:variable name="clicks2">
      <xsl:value-of select="$clicks4 * 2"/>
    </xsl:variable>
    <xsl:variable name="clicks8">
      <xsl:value-of select="$clicks4 div 2"/>
    </xsl:variable>
    <xsl:variable name="clicks16">
      <xsl:value-of select="$clicks4 div 4"/>
    </xsl:variable>
    <xsl:variable name="clicks32">
      <xsl:value-of select="$clicks4 div 8"/>
    </xsl:variable>
    <xsl:variable name="clicks64">
      <xsl:value-of select="$clicks4 div 16"/>
    </xsl:variable>
    <xsl:variable name="clicks128">
      <xsl:value-of select="$clicks4 div 32"/>
    </xsl:variable>
    <xsl:variable name="clicks256">
      <xsl:value-of select="$clicks4 div 64"/>
    </xsl:variable>
    <xsl:variable name="clicks512">
      <xsl:value-of select="$clicks4 div 128"/>
    </xsl:variable>
    <xsl:variable name="clicks1024">
      <xsl:value-of select="$clicks4 div 256"/>
    </xsl:variable>
    <xsl:variable name="clicks2048">
      <xsl:value-of select="$clicks4 div 512"/>
    </xsl:variable>

    <!-- dotted values -->
    <xsl:variable name="clicks1dot">
      <xsl:value-of select="$clicks1 + ($clicks1 div 2)"/>
    </xsl:variable>
    <xsl:variable name="clicks2dot">
      <xsl:value-of select="$clicks2 +( $clicks2 div 2)"/>
    </xsl:variable>
    <xsl:variable name="clicks4dot">
      <xsl:value-of select="$clicks4 + ($clicks4 div 2)"/>
    </xsl:variable>
    <xsl:variable name="clicks8dot">
      <xsl:value-of select="$clicks8 + ($clicks8 div 2)"/>
    </xsl:variable>
    <xsl:variable name="clicks16dot">
      <xsl:value-of select="$clicks16 + ($clicks16 div 2)"/>
    </xsl:variable>
    <xsl:variable name="clicks32dot">
      <xsl:value-of select="$clicks32 + ($clicks32 div 2)"/>
    </xsl:variable>
    <xsl:variable name="clicks64dot">
      <xsl:value-of select="$clicks64 + ($clicks64 div 2)"/>
    </xsl:variable>
    <xsl:variable name="clicks128dot">
      <xsl:value-of select="$clicks128 + ($clicks128 div 2)"/>
    </xsl:variable>
    <xsl:variable name="clicks256dot">
      <xsl:value-of select="$clicks256 + ($clicks256 div 2)"/>
    </xsl:variable>
    <xsl:variable name="clicks512dot">
      <xsl:value-of select="$clicks512 + ($clicks512 div 2)"/>
    </xsl:variable>
    <xsl:variable name="clicks1024dot">
      <xsl:value-of select="$clicks1024 + ($clicks1024 div 2)"/>
    </xsl:variable>
    <xsl:variable name="clicks2048dot">
      <xsl:value-of select="$clicks2048 + ($clicks2048 div 2)"/>
    </xsl:variable>

    <!-- double dotted values -->
    <xsl:variable name="clicks1dot2">
      <xsl:value-of select="$clicks1 + ($clicks1 div 2) + ($clicks1 div 4)"/>
    </xsl:variable>
    <xsl:variable name="clicks2dot2">
      <xsl:value-of select="$clicks2 + ($clicks2 div 2) + ($clicks2 div 4)"/>
    </xsl:variable>
    <xsl:variable name="clicks4dot2">
      <xsl:value-of select="$clicks4 + ($clicks4 div 2) + ($clicks4 div 4)"/>
    </xsl:variable>
    <xsl:variable name="clicks8dot2">
      <xsl:value-of select="$clicks8 + ($clicks8 div 2) + ($clicks8 div 4)"/>
    </xsl:variable>
    <xsl:variable name="clicks16dot2">
      <xsl:value-of select="$clicks16 + ($clicks16 div 2) + ($clicks16 div 4)"/>
    </xsl:variable>
    <xsl:variable name="clicks32dot2">
      <xsl:value-of select="$clicks32 + ($clicks32 div 2) + ($clicks32 div 4)"/>
    </xsl:variable>
    <xsl:variable name="clicks64dot2">
      <xsl:value-of select="$clicks64 + ($clicks64 div 2) + ($clicks32 div 4)"/>
    </xsl:variable>
    <xsl:variable name="clicks128dot2">
      <xsl:value-of select="$clicks128 + ($clicks128 div 2) + ($clicks128 div 4)"/>
    </xsl:variable>
    <xsl:variable name="clicks256dot2">
      <xsl:value-of select="$clicks256 + ($clicks256 div 2) + ($clicks256 div 4)"/>
    </xsl:variable>
    <xsl:variable name="clicks512dot2">
      <xsl:value-of select="$clicks512 + ($clicks512 div 2) + ($clicks512 div 4)"/>
    </xsl:variable>
    <xsl:variable name="clicks1024dot2">
      <xsl:value-of select="$clicks1024 + ($clicks1024 div 2) + ($clicks1024 div 4)"/>
    </xsl:variable>
    <xsl:variable name="clicks2048dot2">
      <xsl:value-of select="$clicks2048 + ($clicks2048 div 2) + ($clicks2048 div 4)"/>
    </xsl:variable>

    <!-- triplet values -->
    <xsl:variable name="clicks3">
      <xsl:value-of select="$clicks1 div 3"/>
    </xsl:variable>
    <xsl:variable name="clicks6">
      <xsl:value-of select="$clicks2 div 3"/>
    </xsl:variable>
    <xsl:variable name="clicks12">
      <xsl:value-of select="$clicks4 div 3"/>
    </xsl:variable>
    <xsl:variable name="clicks24">
      <xsl:value-of select="$clicks8 div 3"/>
    </xsl:variable>
    <xsl:variable name="clicks48">
      <xsl:value-of select="$clicks16 div 3"/>
    </xsl:variable>
    <xsl:variable name="clicks96">
      <xsl:value-of select="$clicks32 div 3"/>
    </xsl:variable>
    <xsl:variable name="clicks192">
      <xsl:value-of select="$clicks64 div 3"/>
    </xsl:variable>
    <xsl:variable name="clicks384">
      <xsl:value-of select="$clicks128 div 3"/>
    </xsl:variable>
    <xsl:variable name="clicks768">
      <xsl:value-of select="$clicks256 div 3"/>
    </xsl:variable>

    <!-- Evaluate $duration against the lookup table -->
    <xsl:choose>
      <!-- Undotted note values -->
      <xsl:when test="$duration = $clicks1">1</xsl:when>
      <xsl:when test="$duration = $clicks2">2</xsl:when>
      <xsl:when test="$duration = $clicks4">4</xsl:when>
      <xsl:when test="$duration = $clicks8">8</xsl:when>
      <xsl:when test="$duration = $clicks16">16</xsl:when>
      <xsl:when test="$duration = $clicks32">32</xsl:when>
      <xsl:when test="$duration = $clicks64">64</xsl:when>
      <xsl:when test="$duration = $clicks128">128</xsl:when>
      <xsl:when test="$duration = $clicks256">256</xsl:when>
      <xsl:when test="$duration = $clicks512">512</xsl:when>
      <xsl:when test="$duration = $clicks1024">1024</xsl:when>
      <xsl:when test="$duration = $clicks2048">2048</xsl:when>

      <!-- Dotted note values -->
      <xsl:when test="$duration = $clicks1dot">1.</xsl:when>
      <xsl:when test="$duration = $clicks2dot">2.</xsl:when>
      <xsl:when test="$duration = $clicks4dot">4.</xsl:when>
      <xsl:when test="$duration = $clicks8dot">8.</xsl:when>
      <xsl:when test="$duration = $clicks16dot">16.</xsl:when>
      <xsl:when test="$duration = $clicks32dot">32.</xsl:when>
      <xsl:when test="$duration = $clicks64dot">64.</xsl:when>
      <xsl:when test="$duration = $clicks128dot">128.</xsl:when>
      <xsl:when test="$duration = $clicks256dot">256.</xsl:when>
      <xsl:when test="$duration = $clicks512dot">512.</xsl:when>
      <xsl:when test="$duration = $clicks1024dot">1024.</xsl:when>
      <xsl:when test="$duration = $clicks2048dot">2048.</xsl:when>

      <!-- Double dotted note values -->
      <xsl:when test="$duration = $clicks1dot2">1..</xsl:when>
      <xsl:when test="$duration = $clicks2dot2">2..</xsl:when>
      <xsl:when test="$duration = $clicks4dot2">4..</xsl:when>
      <xsl:when test="$duration = $clicks8dot2">8..</xsl:when>
      <xsl:when test="$duration = $clicks16dot2">16..</xsl:when>
      <xsl:when test="$duration = $clicks32dot2">32..</xsl:when>
      <xsl:when test="$duration = $clicks64dot2">64..</xsl:when>
      <xsl:when test="$duration = $clicks128dot2">128..</xsl:when>
      <xsl:when test="$duration = $clicks256dot2">256..</xsl:when>
      <xsl:when test="$duration = $clicks512dot2">512..</xsl:when>
      <xsl:when test="$duration = $clicks1024dot2">1024..</xsl:when>
      <xsl:when test="$duration = $clicks2048dot2">2048..</xsl:when>

      <!-- Quantize triplets to next smaller undotted value -->
      <xsl:when test="$duration = $clicks3">
        <xsl:value-of select="$clicks2"/>
      </xsl:when>
      <xsl:when test="$duration = $clicks6">
        <xsl:value-of select="$clicks4"/>
      </xsl:when>
      <xsl:when test="$duration = $clicks12">
        <xsl:value-of select="$clicks8"/>
      </xsl:when>
      <xsl:when test="$duration = $clicks24">
        <xsl:value-of select="$clicks16"/>
      </xsl:when>
      <xsl:when test="$duration = $clicks48">
        <xsl:value-of select="$clicks32"/>
      </xsl:when>
      <xsl:when test="$duration = $clicks96">
        <xsl:value-of select="$clicks64"/>
      </xsl:when>
      <xsl:when test="$duration = $clicks192">
        <xsl:value-of select="$clicks128"/>
      </xsl:when>
      <xsl:when test="$duration = $clicks384">
        <xsl:value-of select="$clicks256"/>
      </xsl:when>
      <xsl:when test="$duration = $clicks768">
        <xsl:value-of select="$clicks512"/>
      </xsl:when>

      <!-- If nothing else has matched so far, quantize to the next smaller undotted value. -->
      <xsl:when test="$duration > number($clicks1)">1</xsl:when>
      <xsl:when test="$duration > number($clicks2) and $duration &lt; number($clicks1)">2</xsl:when>
      <xsl:when test="$duration > number($clicks4) and $duration &lt; number($clicks2)">4</xsl:when>
      <xsl:when test="$duration > number($clicks8) and $duration &lt; number($clicks4)">8</xsl:when>
      <xsl:when test="$duration > number($clicks16) and $duration &lt; number($clicks8)"
        >16</xsl:when>
      <xsl:when test="$duration > number($clicks32) and $duration &lt; number($clicks16)"
        >32</xsl:when>
      <xsl:when test="$duration > number($clicks64) and $duration &lt; number($clicks32)"
        >64</xsl:when>
      <xsl:when test="$duration > number($clicks128) and $duration &lt; number($clicks64)"
        >128</xsl:when>
      <xsl:when test="$duration > number($clicks256) and $duration &lt; number($clicks128)"
        >256</xsl:when>
      <xsl:when test="$duration > number($clicks512) and $duration &lt; number($clicks256)"
        >512</xsl:when>
      <xsl:when test="$duration > number($clicks1024) and $duration &lt; number($clicks512)"
        >256</xsl:when>
    </xsl:choose>
  </xsl:template>

  <xsl:template name="positionRelative">
    <!-- Create positional attributes -->
    <xsl:if test="@relative-x">
      <xsl:attribute name="ho">
        <xsl:value-of select="format-number(@relative-x  div 5, '###0.########')"/>
        <!-- <xsl:text>vu</xsl:text> -->
      </xsl:attribute>
    </xsl:if>
    <!--<xsl:if test="@default-x and not(@relative-x)">
      <xsl:attribute name="ho">
        <xsl:value-of select="format-number(@default-x div 5, '###0.########')"/>
      </xsl:attribute>
    </xsl:if>-->
    <xsl:if test="@relative-y">
      <xsl:attribute name="vo">
        <xsl:value-of select="format-number(@relative-y div 5, '###0.########')"/>
        <!-- <xsl:text>vu</xsl:text> -->
      </xsl:attribute>
    </xsl:if>
    <!--<xsl:if test="@default-y and not(@relative-y)">
      <xsl:attribute name="vo">
        <xsl:value-of select="format-number(@default-y div 5, '###0.########')"/>
      </xsl:attribute>
    </xsl:if>-->
  </xsl:template>

  <xsl:template name="resolveGrpSym">
    <!-- This template is called recursively as long as there are grpSym elements in the
      tree fragment passed to it -->
    <xsl:param name="in"/>
    <xsl:param name="maxLevel"/>
    <xsl:param name="pass"/>
    <xsl:variable name="newOuterStaffGrp">
      <staffGrp xmlns="http://www.music-encoding.org/ns/mei">
        <xsl:for-each select="$in/mei:staffGrp">
          <xsl:for-each select="mei:staffDef | mei:staffGrp">
            <xsl:choose>
              <xsl:when test="local-name()='staffDef'">
                <xsl:variable name="thisStaff">
                  <xsl:value-of select="number(@n)"/>
                </xsl:variable>
                <xsl:choose>
                  <xsl:when test="following::grpSym[number(@level)=$pass and
                    number(@start)=$thisStaff]">
                    <xsl:variable name="start">
                      <xsl:value-of select="following::grpSym[number(@level)=$pass and
                        number(@start)=$thisStaff]/@start"/>
                    </xsl:variable>
                    <xsl:variable name="end">
                      <xsl:value-of select="following::grpSym[number(@level)=$pass and
                        number(@start)=$thisStaff]/@end"/>
                    </xsl:variable>
                    <staffGrp xmlns="http://www.music-encoding.org/ns/mei">
                      <xsl:copy-of select="following::grpSym[number(@level)=$pass and
                        number(@start)=$thisStaff]/@symbol"/>
                      <xsl:copy-of select="following::grpSym[number(@level)=$pass and
                        number(@start)=$thisStaff]/@barthru"/>
                      <xsl:copy-of select="following::grpSym[number(@level)=$pass and
                        number(@start)=$thisStaff]/@label"/>
                      <xsl:copy-of select="following::grpSym[number(@level)=$pass and
                        number(@start)=$thisStaff]/@label.abbr"/>
                      <xsl:copy-of select="."/>
                      <xsl:copy-of select="following-sibling::mei:staffDef[number(@n) &lt;= $end] |
                        following-sibling::mei:staffGrp[mei:staffDef[number(@n) &lt;= $end]]"/>
                    </staffGrp>
                  </xsl:when>
                  <xsl:when test="following::grpSym[number(@level)=$pass and number(@start) &lt;=
                    $thisStaff and number(@end) &gt;=$thisStaff]">
                    <!-- This node is in the range defined by a grpSym for this pass and has already been copied -->
                  </xsl:when>
                  <xsl:otherwise>
                    <xsl:copy-of select="."/>
                  </xsl:otherwise>
                </xsl:choose>
              </xsl:when>
              <xsl:when test="local-name()='staffGrp'">
                <xsl:variable name="thisStaff">
                  <xsl:value-of select="number(mei:staffDef[1]/@n)"/>
                </xsl:variable>
                <xsl:choose>
                  <xsl:when test="following::grpSym[number(@level)=$pass and
                    number(@start)=$thisStaff]">
                    <xsl:variable name="start">
                      <xsl:value-of select="following::grpSym[number(@level)=$pass and
                        number(@start)=$thisStaff]/@start"/>
                    </xsl:variable>
                    <xsl:variable name="end">
                      <xsl:value-of select="following::grpSym[number(@level)=$pass and
                        number(@start)=$thisStaff]/@end"/>
                    </xsl:variable>
                    <staffGrp xmlns="http://www.music-encoding.org/ns/mei">
                      <xsl:copy-of select="following::grpSym[number(@level)=$pass and
                        number(@start)=$thisStaff]/@symbol"/>
                      <xsl:copy-of select="following::grpSym[number(@level)=$pass and
                        number(@start)=$thisStaff]/@barthru"/>
                      <xsl:copy-of select="following::grpSym[number(@level)=$pass and
                        number(@start)=$thisStaff]/@label"/>
                      <xsl:copy-of select="following::grpSym[number(@level)=$pass and
                        number(@start)=$thisStaff]/@label.abbr"/>
                      <xsl:copy-of select="."/>
                      <xsl:copy-of select="following-sibling::mei:staffDef[number(@n) &lt;= $end] |
                        following-sibling::mei:staffGrp[mei:staffDef[number(@n) &lt;= $end]]"/>
                    </staffGrp>
                  </xsl:when>
                  <xsl:when test="following::grpSym[number(@level)=$pass and number(@start) &lt;=
                    $thisStaff and number(@end) &gt;=$thisStaff]">
                    <!-- This node is in the range defined by a grpSym for this pass and has already been copied -->
                  </xsl:when>
                  <xsl:otherwise>
                    <xsl:copy-of select="."/>
                  </xsl:otherwise>
                </xsl:choose>
              </xsl:when>
            </xsl:choose>
          </xsl:for-each>
        </xsl:for-each>
        <xsl:for-each select="$in/mei:staffGrp/grpSym[@level != $pass]">
          <!-- Pass through any grpSym elements not processed in this pass -->
          <xsl:copy-of select="."/>
        </xsl:for-each>
      </staffGrp>
    </xsl:variable>
    <xsl:choose>
      <xsl:when test="$pass &lt;= $maxLevel">
        <!-- Recurse -->
        <xsl:call-template name="resolveGrpSym">
          <xsl:with-param name="in">
            <xsl:copy-of select="$newOuterStaffGrp"/>
          </xsl:with-param>
          <xsl:with-param name="maxLevel">
            <xsl:value-of select="number($maxLevel)"/>
          </xsl:with-param>
          <xsl:with-param name="pass" select="number($pass + 1)"/>
        </xsl:call-template>
      </xsl:when>
      <xsl:otherwise>
        <!-- Remove redundant outer staffGrp element -->
        <!-- Emit the new outer staffGrp element -->
        <xsl:choose>
          <xsl:when test="count($newOuterStaffGrp/mei:staffGrp/*) = 1">
            <xsl:copy-of select="$newOuterStaffGrp/mei:staffGrp/mei:staffGrp"/>
          </xsl:when>
          <xsl:otherwise>
            <xsl:copy-of select="$newOuterStaffGrp"/>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template name="restvo">
    <!-- This template only applies to rests! -->
    <!-- Values in display-step and display-octave are copied to
      ploc and oloc attributes. -->
    <xsl:if test="rest/display-step">
      <xsl:attribute name="ploc">
        <xsl:value-of select="lower-case(rest/display-step)"/>
      </xsl:attribute>
      <xsl:attribute name="oloc">
        <xsl:value-of select="rest/display-octave"/>
      </xsl:attribute>
    </xsl:if>
  </xsl:template>

  <xsl:template name="size">
    <!-- Notehead size -->
    <xsl:if test="cue or type/@size='cue'">
      <xsl:attribute name="size">cue</xsl:attribute>
    </xsl:if>
  </xsl:template>

  <xsl:template name="staffInitialAttributes">
    <!-- This template collects staff attributes from the first measure. -->
    <xsl:param name="partID"/>
    <xsl:param name="staffNum"/>
    <xsl:variable name="scoreFifths">
      <xsl:value-of select="following::part[attributes[not(transpose) and
        key]][1]/attributes/key/fifths"/>
    </xsl:variable>
    <xsl:variable name="scoreMode">
      <xsl:value-of select="following::part[attributes[not(transpose) and
        key]][1]/attributes/key/mode"/>
    </xsl:variable>
    <xsl:for-each select="following::measure[1]/part[@id=$partID]/attributes">
      <xsl:choose>
        <xsl:when test="$staffNum=''">
          <!-- number of staff lines -->
          <xsl:attribute name="lines">
            <xsl:choose>
              <xsl:when test="staff-details/staff-lines">
                <xsl:value-of select="staff-details[staff-lines][1]/staff-lines"/>
              </xsl:when>
              <xsl:otherwise>5</xsl:otherwise>
            </xsl:choose>
          </xsl:attribute>
          <!-- clef -->
          <xsl:for-each select="clef[1]">
            <xsl:choose>
              <!-- percussion clef -->
              <xsl:when test="sign='percussion'">
                <xsl:attribute name="clef.shape">perc</xsl:attribute>
              </xsl:when>
              <!-- TAB "clef" -->
              <xsl:when test="sign='TAB'">
                <xsl:attribute name="clef.shape">TAB</xsl:attribute>
              </xsl:when>
              <!-- "normal" clef -->
              <xsl:otherwise>
                <xsl:attribute name="clef.line">
                  <xsl:value-of select="line"/>
                </xsl:attribute>
                <xsl:attribute name="clef.shape">
                  <xsl:value-of select="sign"/>
                </xsl:attribute>
                <xsl:if test="clef-octave-change">
                  <xsl:if test="abs(number(clef-octave-change)) != 0">
                    <xsl:attribute name="clef.trans">
                      <xsl:choose>
                        <xsl:when test="number(clef-octave-change) &gt;= 2">15va</xsl:when>
                        <xsl:when test="number(clef-octave-change) = 1">8va</xsl:when>
                        <xsl:when test="number(clef-octave-change) = -1">8vb</xsl:when>
                        <xsl:when test="number(clef-octave-change) &lt;= -2">15vb</xsl:when>
                        <xsl:otherwise>8va</xsl:otherwise>
                      </xsl:choose>
                    </xsl:attribute>
                  </xsl:if>
                </xsl:if>
              </xsl:otherwise>
            </xsl:choose>
            <xsl:if test="@print-object='no'">
              <xsl:attribute name="clef.visible">false</xsl:attribute>
            </xsl:if>
          </xsl:for-each>
          <!-- staff key signature-->
          <xsl:if test="key">
            <xsl:variable name="keySig">
              <xsl:value-of select="key/fifths"/>
            </xsl:variable>
            <xsl:if test="$keySig != $scoreFifths">
              <xsl:choose>
                <xsl:when test="$keySig=0">
                  <xsl:attribute name="key.sig">
                    <xsl:value-of select="$keySig"/>
                  </xsl:attribute>
                </xsl:when>
                <xsl:when test="$keySig &gt; 0">
                  <xsl:attribute name="key.sig"><xsl:value-of select="$keySig"/>s</xsl:attribute>
                </xsl:when>
                <xsl:when test="$keySig &lt; 0">
                  <xsl:attribute name="key.sig"><xsl:value-of select="abs($keySig)"
                    />f</xsl:attribute>
                </xsl:when>
              </xsl:choose>
              <!-- staff key mode -->
              <xsl:if test="key/mode and key/mode != $scoreMode">
                <xsl:attribute name="key.mode">
                  <xsl:value-of select="key/mode"/>
                </xsl:attribute>
              </xsl:if>
            </xsl:if>
            <xsl:if test="key/@print-object='no'">
              <xsl:attribute name="key.sig.show">false</xsl:attribute>
            </xsl:if>
          </xsl:if>
          <!-- tuning for TAB staff -->
          <xsl:if test="staff-details/staff-tuning">
            <xsl:attribute name="tab.strings">
              <xsl:variable name="tabStrings">
                <xsl:for-each select="staff-details/staff-tuning">
                  <xsl:sort select="@line" order="descending"/>
                  <xsl:variable name="thisString">
                    <xsl:value-of select="tuning-step"/>
                  </xsl:variable>
                  <xsl:value-of select="translate(tuning-step,'ABCDEFG','abcdefg')"/>
                  <xsl:value-of select="tuning-octave"/>
                  <xsl:text>&#32;</xsl:text>
                </xsl:for-each>
              </xsl:variable>
              <xsl:value-of select="normalize-space($tabStrings)"/>
            </xsl:attribute>
          </xsl:if>
          <!-- staff transposition -->
          <xsl:choose>
            <!-- transposed -->
            <xsl:when test="transpose">
              <xsl:attribute name="trans.semi">
                <xsl:choose>
                  <xsl:when test="transpose/octave-change">
                    <xsl:variable name="octaveChange">
                      <xsl:value-of select="transpose[1]/octave-change"/>
                    </xsl:variable>
                    <xsl:variable name="chromatic">
                      <xsl:value-of select="transpose[1]/chromatic"/>
                    </xsl:variable>
                    <xsl:value-of select="$chromatic + (12 * $octaveChange)"/>
                  </xsl:when>
                  <xsl:otherwise>
                    <xsl:value-of select="transpose[1]/chromatic"/>
                  </xsl:otherwise>
                </xsl:choose>
              </xsl:attribute>
              <xsl:if test="transpose/diatonic">
                <xsl:attribute name="trans.diat">
                  <xsl:value-of select="transpose[1]/diatonic"/>
                </xsl:attribute>
              </xsl:if>
            </xsl:when>
            <!-- transposed by capo -->
            <xsl:when test="staff-details/capo">
              <xsl:attribute name="trans.semi">
                <xsl:value-of select="staff-details[capo]/capo"/>
              </xsl:attribute>
            </xsl:when>
          </xsl:choose>
          <!-- ppq -->
          <xsl:for-each select="divisions">
            <xsl:if test="number(.) != $scorePPQ">
              <xsl:attribute name="ppq">
                <xsl:value-of select="."/>
              </xsl:attribute>
            </xsl:if>
          </xsl:for-each>
          <!-- staff visibility -->
          <xsl:if test="staff-details/@print-object='no'">
            <xsl:attribute name="visible">false</xsl:attribute>
          </xsl:if>
        </xsl:when>
        <xsl:otherwise>
          <!-- number of staff lines -->
          <xsl:attribute name="lines">
            <xsl:choose>
              <xsl:when test="staff-details[@number=string($staffNum)]/staff-lines">
                <xsl:value-of select="staff-details[@number=string($staffNum)]/staff-lines"/>
              </xsl:when>
              <xsl:otherwise>
                <xsl:text>5</xsl:text>
              </xsl:otherwise>
            </xsl:choose>
          </xsl:attribute>
          <!-- clef -->
          <xsl:for-each select="clef[@number=string($staffNum)]">
            <xsl:choose>
              <!-- percussion clef -->
              <xsl:when test="sign='percussion'">
                <xsl:attribute name="clef.shape">perc</xsl:attribute>
              </xsl:when>
              <!-- TAB "clef" -->
              <xsl:when test="sign='TAB'">
                <xsl:attribute name="clef.shape">TAB</xsl:attribute>
              </xsl:when>
              <!-- "normal" clef -->
              <xsl:otherwise>
                <xsl:attribute name="clef.line">
                  <xsl:value-of select="line"/>
                </xsl:attribute>
                <xsl:attribute name="clef.shape">
                  <xsl:value-of select="sign"/>
                </xsl:attribute>
                <xsl:if test="clef-octave-change">
                  <xsl:if test="abs(number(clef-octave-change)) != 0">
                    <xsl:attribute name="clef.trans">
                      <xsl:choose>
                        <xsl:when test="number(clef-octave-change) &gt;= 2">15va</xsl:when>
                        <xsl:when test="number(clef-octave-change) = 1">8va</xsl:when>
                        <xsl:when test="number(clef-octave-change) = -1">8vb</xsl:when>
                        <xsl:when test="number(clef-octave-change) &lt;= -2">15vb</xsl:when>
                        <xsl:otherwise>8va</xsl:otherwise>
                      </xsl:choose>
                    </xsl:attribute>
                  </xsl:if>
                </xsl:if>
              </xsl:otherwise>
            </xsl:choose>
            <xsl:if test="@print-object='no'">
              <xsl:attribute name="clef.visible">false</xsl:attribute>
            </xsl:if>
          </xsl:for-each>
          <!-- staff key signature-->
          <xsl:if test="key">
            <xsl:variable name="keySig">
              <xsl:choose>
                <xsl:when test="key[@number=string($staffNum)]">
                  <xsl:value-of select="key[@number=string($staffNum)]/fifths"/>
                </xsl:when>
                <xsl:otherwise>
                  <xsl:value-of select="key[1]/fifths"/>
                </xsl:otherwise>
              </xsl:choose>
            </xsl:variable>
            <xsl:if test="$keySig != $scoreFifths">
              <xsl:choose>
                <xsl:when test="$keySig=0">
                  <xsl:attribute name="key.sig">
                    <xsl:value-of select="$keySig"/>
                  </xsl:attribute>
                </xsl:when>
                <xsl:when test="$keySig &gt; 0">
                  <xsl:attribute name="key.sig"><xsl:value-of select="$keySig"/>s</xsl:attribute>
                </xsl:when>
                <xsl:when test="$keySig &lt; 0">
                  <xsl:attribute name="key.sig"><xsl:value-of select="abs($keySig)"
                    />f</xsl:attribute>
                </xsl:when>
              </xsl:choose>
              <!-- staff key mode -->
              <xsl:if test="key/mode">
                <xsl:variable name="keyMode">
                  <xsl:choose>
                    <xsl:when test="key[@number=string($staffNum)]">
                      <xsl:value-of select="key[@number=string($staffNum)]/mode"/>
                    </xsl:when>
                    <xsl:otherwise>
                      <xsl:value-of select="key[1]/mode"/>
                    </xsl:otherwise>
                  </xsl:choose>
                </xsl:variable>
                <xsl:if test="$keyMode != $scoreMode">
                  <xsl:attribute name="key.mode">
                    <xsl:value-of select="$keyMode"/>
                  </xsl:attribute>
                </xsl:if>
              </xsl:if>
              <xsl:if test="key/@print-object='no'">
                <xsl:attribute name="key.sig.show">false</xsl:attribute>
              </xsl:if>
            </xsl:if>
          </xsl:if>
          <!-- tuning for TAB staff -->
          <xsl:if test="staff-details[@number=string($staffNum)]/staff-tuning">
            <xsl:attribute name="tab.strings">
              <xsl:variable name="tabStrings">
                <xsl:for-each select="staff-details[@number=string($staffNum)]/staff-tuning">
                  <xsl:sort select="@line" order="descending"/>
                  <xsl:variable name="thisString">
                    <xsl:value-of select="tuning-step"/>
                  </xsl:variable>
                  <xsl:value-of select="translate(tuning-step,'ABCDEFG','abcdefg')"/>
                  <xsl:value-of select="tuning-octave"/>
                  <xsl:text>&#32;</xsl:text>
                </xsl:for-each>
              </xsl:variable>
              <xsl:value-of select="normalize-space($tabStrings)"/>
            </xsl:attribute>
          </xsl:if>
          <!-- staff transposition -->
          <xsl:choose>
            <!-- transposed -->
            <xsl:when test="transpose[@number=string($staffNum)]">
              <xsl:attribute name="trans.semi">
                <xsl:choose>
                  <xsl:when test="transpose[@number=string($staffNum)]/octave-change">
                    <xsl:variable name="octaveChange">
                      <xsl:value-of select="transpose[@number=string($staffNum)]/octave-change"/>
                    </xsl:variable>
                    <xsl:variable name="chromatic">
                      <xsl:value-of select="transpose[@number=string($staffNum)]/chromatic"/>
                    </xsl:variable>
                    <xsl:value-of select="$chromatic + (12 * $octaveChange)"/>
                  </xsl:when>
                  <xsl:otherwise>
                    <xsl:value-of select="transpose[@number=string($staffNum)]/chromatic"/>
                  </xsl:otherwise>
                </xsl:choose>
              </xsl:attribute>
              <xsl:if test="transpose[@number=string($staffNum)]/diatonic">
                <xsl:attribute name="trans.diat">
                  <xsl:value-of select="transpose[@number=string($staffNum)]/diatonic"/>
                </xsl:attribute>
              </xsl:if>
            </xsl:when>
            <!-- transposed by capo -->
            <xsl:when test="staff-details[@number=string($staffNum)]/capo">
              <xsl:attribute name="trans.semi">
                <xsl:value-of select="staff-details[@number=string($staffNum)]/capo"/>
              </xsl:attribute>
            </xsl:when>
          </xsl:choose>
          <!-- ppq -->
          <xsl:for-each select="divisions">
            <xsl:if test="number(.) != $scorePPQ">
              <xsl:attribute name="ppq">
                <xsl:value-of select="."/>
              </xsl:attribute>
            </xsl:if>
          </xsl:for-each>
          <!-- staff visibility -->
          <xsl:if test="staff-details[@number=string($staffNum)]/@print-object='no'">
            <xsl:attribute name="visible">false</xsl:attribute>
          </xsl:if>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:for-each>
    <xsl:choose>
      <xsl:when test="$staffNum = '' and
        following::measure[1]/part[@id=$partID]/print/staff-layout/staff-distance">
        <xsl:for-each
          select="following::measure[1]/part[@id=$partID]/print/staff-layout/staff-distance[1]">
          <xsl:attribute name="spacing">
            <xsl:value-of select="format-number(. div 5, '###0.########')"/>
            <!-- <xsl:text>vu</xsl:text> -->
          </xsl:attribute>
        </xsl:for-each>
      </xsl:when>
      <xsl:otherwise>
        <xsl:for-each
          select="following::measure[1]/part[@id=$partID]/print/staff-layout[string(@number)=$staffNum]/staff-distance">
          <xsl:attribute name="spacing">
            <!--<xsl:value-of select="$staffNum"/>-->
            <xsl:value-of select="format-number(. div 5, '###0.########')"/>
            <!-- <xsl:text>vu</xsl:text> -->
          </xsl:attribute>
        </xsl:for-each>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <!-- Convert tstamp.ges value to musical time. -->
  <xsl:template name="tstamp.ges2beat">
    <xsl:param name="tstamp.ges"/>
    <xsl:variable name="thisPart">
      <xsl:value-of select="ancestor::part/@id"/>
    </xsl:variable>
    <xsl:variable name="ppq">
      <xsl:choose>
        <xsl:when test="ancestor::part[attributes/divisions]">
          <xsl:value-of select="ancestor::part[attributes/divisions]/attributes/divisions"/>
        </xsl:when>
        <xsl:when test="preceding::part[@id=$thisPart and attributes/divisions]">
          <xsl:value-of select="preceding::part[@id=$thisPart and
            attributes/divisions][1]/attributes/divisions"/>
        </xsl:when>
      </xsl:choose>
    </xsl:variable>
    <xsl:variable name="meterUnit">
      <xsl:choose>
        <xsl:when test="ancestor::part[@id=$thisPart and
          attributes/time/beat-type]/attributes/time/beat-type">
          <xsl:value-of select="ancestor::part[@id=$thisPart and
            attributes/time/beat-type]/attributes/time/beat-type"/>
        </xsl:when>
        <xsl:when test="preceding::part[@id=$thisPart and attributes/time]">
          <xsl:value-of select="preceding::part[@id=$thisPart and
            attributes/time][1]/attributes/time/beat-type"/>
        </xsl:when>
        <xsl:otherwise>4</xsl:otherwise>
      </xsl:choose>
    </xsl:variable>
    <xsl:choose>
      <xsl:when test="$meterUnit = 4">
        <xsl:value-of select="format-number(1 + ($tstamp.ges div $ppq), '###0.########')"/>
      </xsl:when>
      <xsl:when test="$meterUnit != 4">
        <xsl:value-of select="format-number(1 + ($tstamp.ges div $ppq) * ($meterUnit div 4),
          '###0.########')"/>
      </xsl:when>
    </xsl:choose>
  </xsl:template>

  <xsl:template name="wrapRend">
    <xsl:param name="in"/>
    <rend xmlns="http://www.music-encoding.org/ns/mei">
      <!-- Separate attributes first -->
      <xsl:if test="@font-family">
        <xsl:attribute name="fontfam">
          <xsl:value-of select="normalize-space(@font-family)"/>
        </xsl:attribute>
      </xsl:if>
      <xsl:if test="@font-style">
        <xsl:attribute name="fontstyle">
          <xsl:value-of select="@font-style"/>
        </xsl:attribute>
      </xsl:if>
      <xsl:if test="@font-size">
        <xsl:attribute name="fontsize">
          <xsl:value-of select="@font-size"/>
        </xsl:attribute>
      </xsl:if>
      <xsl:if test="@font-weight ">
        <xsl:attribute name="fontweight">
          <xsl:value-of select="@font-weight"/>
        </xsl:attribute>
      </xsl:if>
      <xsl:choose>
        <xsl:when test="@halign">
          <xsl:attribute name="halign">
            <xsl:value-of select="@halign"/>
          </xsl:attribute>
        </xsl:when>
        <xsl:when test="@justify">
          <xsl:attribute name="halign">
            <xsl:value-of select="@justify"/>
          </xsl:attribute>
        </xsl:when>
      </xsl:choose>
      <xsl:if test="@valign">
        <xsl:copy-of select="@valign"/>
      </xsl:if>
      <xsl:if test="@rotation">
        <xsl:copy-of select="@rotation"/>
      </xsl:if>
      <xsl:choose>
        <xsl:when test="matches(normalize-space(@color), '(#[0-9A-Fa-f]{8,8})')">
          <!-- convert MusicXML CSS4 color value to CSS3 rgba value -->
          <xsl:attribute name="color">
            <xsl:call-template name="aarrggbb2css">
              <xsl:with-param name="aarrggbb">
                <xsl:value-of select="@color"/>
              </xsl:with-param>
            </xsl:call-template>
          </xsl:attribute>
        </xsl:when>
        <xsl:when test="matches(normalize-space(@color),
          '^#[0-9A-Fa-f]{6,6}$|^aqua$|^black$|^blue$|^fuchsia$|^gray$|^green$|^lime$|^maroon$|^navy$|^olive$|^purple$|^red$|^silver$|^teal$|^white$|^yellow')">
          <!-- pass through hex and named color values -->
          <xsl:attribute name="color">
            <xsl:value-of select="normalize-space(@color)"/>
          </xsl:attribute>
        </xsl:when>
      </xsl:choose>
      <xsl:copy-of select="@xml:lang"/>
      <xsl:copy-of select="@xml:space"/>
      <!-- Other values go in @rend -->
      <xsl:if test="@underline | @overline |@line-through | @dir | @enclosure">
        <xsl:variable name="rendValue">
          <xsl:if test="@underline">
            <xsl:text>underline</xsl:text>
            <xsl:text>(</xsl:text>
            <xsl:value-of select="@underline"/>
            <xsl:text>)&#32;</xsl:text>
          </xsl:if>
          <xsl:if test="@overline">
            <xsl:text>overline</xsl:text>
            <xsl:text>(</xsl:text>
            <xsl:value-of select="@overline"/>
            <xsl:text>)&#32;</xsl:text>
          </xsl:if>
          <xsl:if test="@line-through">
            <xsl:text>line-through</xsl:text>
            <xsl:text>(</xsl:text>
            <xsl:value-of select="@line-through"/>
            <xsl:text>)&#32;</xsl:text>
          </xsl:if>
          <xsl:if test="@letter-spacing">
            <xsl:text>letter-spacing</xsl:text>
            <xsl:text>(</xsl:text>
            <xsl:value-of select="format-number(@letter-spacing, '###0.########')"/>
            <xsl:text>)&#32;</xsl:text>
          </xsl:if>
          <xsl:if test="@line-height">
            <xsl:text>line-height</xsl:text>
            <xsl:text>(</xsl:text>
            <xsl:value-of select="format-number(@line-height, '###0.########')"/>
            <xsl:text>)&#32;</xsl:text>
          </xsl:if>
          <xsl:if test="@dir">
            <xsl:value-of select="@dir"/>
            <xsl:text>&#32;</xsl:text>
          </xsl:if>
          <xsl:choose>
            <xsl:when test="@enclosure = 'rectangle' or @enclosure = 'square'">
              <xsl:text>box&#32;</xsl:text>
            </xsl:when>
            <xsl:when test="@enclosure = 'oval' or @enclosure = 'circle'">
              <xsl:text>circle&#32;</xsl:text>
            </xsl:when>
            <xsl:when test="@enclosure = 'triangle'">
              <xsl:text>tbox&#32;</xsl:text>
            </xsl:when>
            <xsl:when test="@enclosure = 'diamond'">
              <xsl:text>dbox&#32;</xsl:text>
            </xsl:when>
          </xsl:choose>
        </xsl:variable>
        <xsl:if test="normalize-space($rendValue) != ''">
          <xsl:attribute name="rend">
            <xsl:value-of select="normalize-space($rendValue)"/>
          </xsl:attribute>
        </xsl:if>
      </xsl:if>
      <xsl:copy-of select="$in"/>
    </rend>
  </xsl:template>

</xsl:stylesheet>
