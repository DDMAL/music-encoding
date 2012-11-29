<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"
  xmlns:mei="http://www.music-encoding.org/ns/mei" xmlns:xlink="http://www.w3.org/1999/xlink"
  exclude-result-prefixes="mei">
  <xsl:output method="xml" indent="yes" encoding="UTF-8" omit-xml-declaration="no" standalone="no"/>

  <!-- global variables -->
  <xsl:variable name="nl">
    <xsl:text>&#xa;</xsl:text>
  </xsl:variable>
  <xsl:variable name="progname">
    <xsl:text>musicxml2mei</xsl:text>
  </xsl:variable>
  <xsl:variable name="progversion">
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

  <!-- Match document root -->
  <xsl:template match="/">
    <mei xmlns="http://www.music-encoding.org/ns/mei" meiversion="2012">
      <xsl:apply-templates select="score-timewise" mode="header"/>
      <music>
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
                      select="descendant::part[attributes/time/@symbol][1]/attributes/time/@symbol"
                    />
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
                  <xsl:variable name="keysig">
                    <xsl:value-of select="descendant::part[attributes[not(transpose) and
                      key]][1]/attributes/key/fifths"/>
                  </xsl:variable>
                  <xsl:choose>
                    <xsl:when test="$keysig=''">
                      <xsl:attribute name="key.sig">
                        <xsl:text>0</xsl:text>
                      </xsl:attribute>
                    </xsl:when>
                    <xsl:when test="$keysig=0">
                      <xsl:attribute name="key.sig">
                        <xsl:value-of select="$keysig"/>
                      </xsl:attribute>
                    </xsl:when>
                    <xsl:when test="$keysig &gt; 0">
                      <xsl:attribute name="key.sig"><xsl:value-of select="$keysig"
                        />s</xsl:attribute>
                    </xsl:when>
                    <xsl:when test="$keysig &lt; 0">
                      <xsl:attribute name="key.sig">
                        <xsl:value-of select="abs($keysig)"/>f</xsl:attribute>
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
                <xsl:copy-of select="$defaultLayout"/>
              </scoreDef>
            </score>
          </mdiv>
        </body>
      </music>
    </mei>
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
        <pubStmt/>
        <!-- File encoding date, etc. goes in notesStmt here -->
        <notesStmt>
          <annot>
            <xsl:text>Transcoded from a MusicXML </xsl:text>
            <xsl:if test="@version">
              <xsl:text>version </xsl:text>
              <xsl:value-of select="@version"/>
              <xsl:text> </xsl:text>
            </xsl:if>
            <xsl:text>file on </xsl:text>
            <date>
              <xsl:value-of select="format-date(current-date(), '[Y]-[M02]-[D02]')"/>
            </date>
            <xsl:text>using an XSLT stylesheet (</xsl:text>
            <xsl:value-of select="$progname"/>
            <xsl:text> </xsl:text>
            <xsl:value-of select="$progversion"/>
            <xsl:text>).</xsl:text>
          </annot>
        </notesStmt>
        <xsl:if test="work/work-title or movement-title">
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
              <xsl:if test="identification/encoding/software">
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
                      <xsl:text> </xsl:text>
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
        </xsl:if>
      </fileDesc>
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
            </titleStmt>
          </work>
        </workDesc>
      </xsl:if>
    </meiHead>
  </xsl:template>

  <xsl:template match="part-list" mode="layout">
    <!-- outerStaffGrp holds basic layout info -->
    <xsl:variable name="outerStaffGrp">
      <staffGrp xmlns="http://www.music-encoding.org/ns/mei">
        <xsl:variable name="temptree">
          <!-- Create staffDef elements, copy part-group elements  -->
          <xsl:apply-templates select="score-part|part-group" mode="layout"/>
        </xsl:variable>
        <xsl:variable name="temptree2">
          <!-- Number staves -->
          <xsl:apply-templates select="$temptree" mode="numberStaves"/>
        </xsl:variable>
        <!-- Emit staffGrp and staffDef elements already created -->
        <xsl:copy-of select="$temptree2/mei:staffGrp|$temptree2/mei:staffDef"/>
        <!-- Create stand-off staff grouping symbols -->
        <xsl:apply-templates select="$temptree2/part-group[@type='start' and group-symbol]"
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
          attributes by calling makeStaffAttributes, then make a child instrument
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
          <xsl:call-template name="makeStaffAttributes">
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

  <xsl:template match="part-group" mode="layout">
    <xsl:copy-of select="."/>
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
                'flat',                 '&#x266d;'), 'sharp', '&#x266f;')"/>
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

  <xsl:template name="makeStaff">
    <!-- This template is called recursively to create the desired number
      of staves for a part. -->
    <xsl:param name="partID"/>
    <xsl:param name="needed">1</xsl:param>
    <xsl:param name="made">0</xsl:param>
    <xsl:if test="$made &lt; $needed">
      <staffDef xmlns="http://www.music-encoding.org/ns/mei">
        <xsl:call-template name="makeStaffAttributes">
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

  <xsl:template name="makeStaffAttributes">
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
                <xsl:value-of select="staff-details[1]/staff-lines"/>
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
                <xsl:attribute name="tab.strings">
                  <xsl:variable name="tabstrings">
                    <xsl:for-each select="following-sibling::staff-details">
                      <xsl:for-each select="staff-tuning">
                        <xsl:sort select="@line" order="descending"/>
                        <xsl:variable name="thisstring">
                          <xsl:value-of select="tuning-step"/>
                        </xsl:variable>
                        <xsl:value-of select="translate(tuning-step,'ABCDEFG','abcdefg')"/>
                        <xsl:value-of select="tuning-octave"/>
                        <xsl:text> </xsl:text>
                      </xsl:for-each>
                    </xsl:for-each>
                  </xsl:variable>
                  <xsl:value-of select="normalize-space($tabstrings)"/>
                </xsl:attribute>
                <!-- transposition via capo -->
                <xsl:if test="following-sibling::staff-details/capo">
                  <xsl:attribute name="trans.semi">
                    <xsl:value-of select="following-sibling::staff-details[1]/capo"/>
                  </xsl:attribute>
                </xsl:if>
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
                        <xsl:when test="clef-octave-change = '2'">15va</xsl:when>
                        <xsl:when test="clef-octave-change = '1'">8va</xsl:when>
                        <xsl:when test="clef-octave-change = '-1'">8vb</xsl:when>
                        <xsl:when test="clef-octave-change = '-2'">15vb</xsl:when>
                      </xsl:choose>
                    </xsl:attribute>
                  </xsl:if>
                </xsl:if>
              </xsl:otherwise>
            </xsl:choose>
          </xsl:for-each>
          <!-- staff transposition -->
          <xsl:if test="transpose">
            <xsl:attribute name="trans.semi">
              <xsl:choose>
                <xsl:when test="transpose/octave-change">
                  <xsl:variable name="octavechange">
                    <xsl:value-of select="transpose[1]/octave-change"/>
                  </xsl:variable>
                  <xsl:variable name="chromatic">
                    <xsl:value-of select="transpose[1]/chromatic"/>
                  </xsl:variable>
                  <xsl:value-of select="$chromatic + (12 * $octavechange)"/>
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
          </xsl:if>
          <xsl:for-each select="divisions">
            <xsl:if test="number(.) != $scorePPQ">
              <xsl:attribute name="ppq">
                <xsl:value-of select="."/>
              </xsl:attribute>
            </xsl:if>
          </xsl:for-each>
          <!-- staff key signature-->
          <xsl:if test="key">
            <xsl:variable name="keysig">
              <xsl:value-of select="key/fifths"/>
            </xsl:variable>
            <xsl:if test="$keysig != $scoreFifths">
              <xsl:choose>
                <xsl:when test="$keysig=0">
                  <xsl:attribute name="key.sig">
                    <xsl:value-of select="$keysig"/>
                  </xsl:attribute>
                </xsl:when>
                <xsl:when test="$keysig &gt; 0">
                  <xsl:attribute name="key.sig"><xsl:value-of select="$keysig"/>s</xsl:attribute>
                </xsl:when>
                <xsl:when test="$keysig &lt; 0">
                  <xsl:attribute name="key.sig"><xsl:value-of select="abs($keysig)"
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
          <xsl:for-each select="clef[@number=string($staffNum)]">
            <xsl:choose>
              <!-- percussion clef -->
              <xsl:when test="sign='percussion'">
                <xsl:attribute name="clef.shape">perc</xsl:attribute>
              </xsl:when>
              <!-- TAB "clef" -->
              <xsl:when test="sign='TAB'">
                <xsl:attribute name="clef.shape">TAB</xsl:attribute>
                <xsl:attribute name="tab.strings">
                  <xsl:variable name="tabstrings">
                    <xsl:for-each select="following-sibling::staff-details">
                      <xsl:for-each select="staff-tuning">
                        <xsl:sort select="@line" order="descending"/>
                        <xsl:variable name="thisstring">
                          <xsl:value-of select="tuning-step"/>
                        </xsl:variable>
                        <xsl:value-of select="translate(tuning-step,'ABCDEFG','abcdefg')"/>
                        <xsl:value-of select="tuning-octave"/>
                        <xsl:text> </xsl:text>
                      </xsl:for-each>
                    </xsl:for-each>
                  </xsl:variable>
                  <xsl:value-of select="normalize-space($tabstrings)"/>
                </xsl:attribute>
                <!-- transposition via capo -->
                <xsl:if test="following-sibling::staff-details/capo">
                  <xsl:attribute name="trans.semi">
                    <xsl:value-of select="following-sibling::staff-details/capo"/>
                  </xsl:attribute>
                </xsl:if>
              </xsl:when>
              <!-- "normal" clef -->
              <xsl:otherwise>
                <xsl:attribute name="lines">
                  <xsl:choose>
                    <xsl:when test="staff-details[@number=string($staffNum)]/staff-lines">
                      <xsl:value-of select="staff-details[@number=string($staffNum)]/staff-lines"/>
                    </xsl:when>
                    <xsl:otherwise>5</xsl:otherwise>
                  </xsl:choose>
                </xsl:attribute>
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
                        <xsl:when test="clef-octave-change = '2'">15va</xsl:when>
                        <xsl:when test="clef-octave-change = '1'">8va</xsl:when>
                        <xsl:when test="clef-octave-change = '-1'">8vb</xsl:when>
                        <xsl:when test="clef-octave-change = '-2'">15vb</xsl:when>
                      </xsl:choose>
                    </xsl:attribute>
                  </xsl:if>
                </xsl:if>
              </xsl:otherwise>
            </xsl:choose>
          </xsl:for-each>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:for-each>
  </xsl:template>

</xsl:stylesheet>
