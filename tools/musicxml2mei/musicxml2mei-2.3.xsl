<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"
  xmlns:mei="http://www.music-encoding.org/ns/mei" xmlns:xlink="http://www.w3.org/1999/xlink"
  xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:f="http://music-encoding.org/tools/musicxml2mei"
  exclude-result-prefixes="mei xs f">
  <xsl:output method="xml" indent="yes" encoding="UTF-8" omit-xml-declaration="no" standalone="no"/>
  <xsl:strip-space elements="*"/>

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

  <!-- 'Match' templates -->
  <xsl:template match="/">
    <mei xmlns="http://www.music-encoding.org/ns/mei" meiversion="2012">
      <xsl:apply-templates select="score-timewise" mode="header"/>
      <xsl:apply-templates select="score-timewise" mode="music"/>
    </mei>
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
                  <xsl:when test="number($keysig)=0">
                    <xsl:attribute name="key.sig">
                      <xsl:value-of select="$keysig"/>
                    </xsl:attribute>
                  </xsl:when>
                  <xsl:when test="number($keysig) &gt; 0">
                    <xsl:attribute name="key.sig"><xsl:value-of select="$keysig"/>s</xsl:attribute>
                  </xsl:when>
                  <xsl:when test="number($keysig) &lt; 0">
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
                      <xsl:apply-templates select="current-group()" mode="stage1"/>
                    </xsl:for-each-group>
                  </ending>
                </xsl:when>
                <xsl:otherwise>
                  <section>
                    <xsl:for-each-group select="current-group()"
                      group-starting-with="measure[part/attributes[time or key]]">
                      <xsl:apply-templates select="current-group()" mode="stage1"/>
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

  <xsl:template match="defaults">
    <!-- CURRENTLY, THE VALUES IN defaults/ ARE PASSED THROUGH
           UNCHANGED. THESE SHOULD BE CONVERTED TO MEI VALUES. -->
    <!-- Process various font options -->
    <xsl:for-each select="music-font">
      <xsl:attribute name="music.name">
        <xsl:value-of select="@font-family"/>
      </xsl:attribute>
      <xsl:attribute name="music.size">
        <xsl:value-of select="@font-size"/>
      </xsl:attribute>
    </xsl:for-each>
    <xsl:for-each select="word-font">
      <xsl:attribute name="text.name">
        <xsl:value-of select="@font-family"/>
      </xsl:attribute>
      <xsl:attribute name="text.size">
        <xsl:value-of select="@font-size"/>
      </xsl:attribute>
    </xsl:for-each>
    <xsl:for-each select="lyric-font">
      <xsl:attribute name="lyric.name">
        <xsl:value-of select="@font-family"/>
      </xsl:attribute>
      <xsl:attribute name="lyric.size">
        <xsl:value-of select="@font-size"/>
      </xsl:attribute>
    </xsl:for-each>
    <!-- Page scaling. Record MusicXML page scale: ratio of virtual units
         (tenths of interline space) to real-world units (millimeters). -->
    <xsl:for-each select="scaling">
      <xsl:attribute name="page.scale"><xsl:value-of select="tenths"/>:<xsl:value-of
          select="millimeters"/></xsl:attribute>
    </xsl:for-each>
    <!-- MusicXML real-world units are millimeters -->
    <xsl:attribute name="page.units">mm</xsl:attribute>
    <!-- Page layout options -->
    <xsl:for-each select="page-layout">
      <xsl:attribute name="page.height">
        <xsl:value-of select="page-height"/>
      </xsl:attribute>
      <xsl:attribute name="page.width">
        <xsl:value-of select="page-width"/>
      </xsl:attribute>
      <xsl:for-each select="page-margins[1]">
        <xsl:attribute name="page.leftmar">
          <xsl:value-of select="left-margin"/>
        </xsl:attribute>
        <xsl:attribute name="page.rightmar">
          <xsl:value-of select="right-margin"/>
        </xsl:attribute>
        <xsl:attribute name="page.topmar">
          <xsl:value-of select="top-margin"/>
        </xsl:attribute>
        <xsl:attribute name="page.botmar">
          <xsl:value-of select="bottom-margin"/>
        </xsl:attribute>
      </xsl:for-each>
    </xsl:for-each>
    <!-- System layout options -->
    <xsl:for-each select="system-layout">
      <xsl:for-each select="system-margins">
        <xsl:attribute name="system.leftmar">
          <xsl:value-of select="left-margin"/>
        </xsl:attribute>
        <xsl:attribute name="system.rightmar">
          <xsl:value-of select="right-margin"/>
        </xsl:attribute>
      </xsl:for-each>
      <xsl:for-each select="system-distance">
        <xsl:attribute name="spacing.system">
          <xsl:value-of select="."/>
        </xsl:attribute>
      </xsl:for-each>
      <xsl:for-each select="top-system-distance">
        <xsl:attribute name="system.topmar">
          <xsl:value-of select="."/>
        </xsl:attribute>
      </xsl:for-each>
    </xsl:for-each>
    <!-- Staff layout options -->
    <xsl:for-each select="staff-layout">
      <xsl:for-each select="staff-distance">
        <xsl:attribute name="spacing.staff">
          <xsl:value-of select="."/>
        </xsl:attribute>
      </xsl:for-each>
    </xsl:for-each>
  </xsl:template>

  <xsl:template match="measure" mode="stage1">
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
          <xsl:if test="part/attributes[1]/key">
            <xsl:variable name="keysig">
              <xsl:value-of select="part[attributes[not(transpose) and
                key]][1]/attributes[not(transpose)][1]/key/fifths"/>
            </xsl:variable>
            <xsl:choose>
              <xsl:when test="number($keysig)=0">
                <xsl:attribute name="key.sig">
                  <xsl:value-of select="$keysig"/>
                </xsl:attribute>
              </xsl:when>
              <xsl:when test="number($keysig) &gt; 0">
                <xsl:attribute name="key.sig"><xsl:value-of select="$keysig"/>s</xsl:attribute>
              </xsl:when>
              <xsl:when test="number($keysig) &lt; 0">
                <xsl:attribute name="key.sig">
                  <xsl:value-of select="abs(number($keysig))"/>f</xsl:attribute>
              </xsl:when>
            </xsl:choose>
            <xsl:if test="part[1]/attributes[1]/key/mode">
              <xsl:attribute name="key.mode">
                <xsl:value-of select="part[1]/attributes[1]/key/mode"/>
              </xsl:attribute>
            </xsl:if>
          </xsl:if>
          <!-- Page layout info -->
          <xsl:for-each select="part[print/page-layout][1]/print/page-layout">
            <xsl:for-each select="page-height">
              <xsl:attribute name="page.height">
                <xsl:value-of select="."/>
              </xsl:attribute>
            </xsl:for-each>
            <xsl:for-each select="page-width">
              <xsl:attribute name="page.width">
                <xsl:value-of select="."/>
              </xsl:attribute>
            </xsl:for-each>
            <xsl:for-each select="page-margins">
              <xsl:attribute name="page.leftmar">
                <xsl:value-of select="left-margin"/>
              </xsl:attribute>
              <xsl:attribute name="page.rightmar">
                <xsl:value-of select="right-margin"/>
              </xsl:attribute>
              <xsl:attribute name="page.topmar">
                <xsl:value-of select="top-margin"/>
              </xsl:attribute>
              <xsl:attribute name="page.botmar">
                <xsl:value-of select="bottom-margin"/>
              </xsl:attribute>
            </xsl:for-each>
          </xsl:for-each>
          <!-- System layout info -->
          <xsl:for-each select="part[print/system-layout][1]/print/system-layout">
            <xsl:for-each select="system-margins">
              <xsl:attribute name="system.leftmar">
                <xsl:value-of select="left-margin"/>
              </xsl:attribute>
              <xsl:attribute name="system.rightmar">
                <xsl:value-of select="right-margin"/>
              </xsl:attribute>
            </xsl:for-each>
            <xsl:for-each select="system-distance">
              <xsl:attribute name="spacing.system">
                <xsl:value-of select="."/>
              </xsl:attribute>
            </xsl:for-each>
            <xsl:for-each select="top-system-distance">
              <xsl:attribute name="system.topmar">
                <xsl:value-of select="."/>
              </xsl:attribute>
            </xsl:for-each>
          </xsl:for-each>
        </scoreDef>
        <!-- Staff-level info -->
        <xsl:for-each select="part[attributes[not(preceding-sibling::note) and
          not(preceding-sibling::forward)][clef or divisions or key or staff-details[*] or
          transpose] or print[*]]">
          <xsl:variable name="partID">
            <xsl:value-of select="@id"/>
          </xsl:variable>
          <xsl:variable name="scoreFifths">
            <xsl:value-of select="preceding::part[attributes[not(transpose) and
              key]][1]/attributes/key[1]/fifths"/>
          </xsl:variable>
          <xsl:variable name="scoreMode">
            <xsl:value-of select="preceding::part[attributes[not(transpose) and
              key]][1]/attributes/key[1]/mode"/>
          </xsl:variable>
          <xsl:choose>
            <xsl:when test="local-name($defaultLayout//*[@xml:id=$partID]) = 'staffDef'">
              <!-- Part has only 1 staff -->
              <xsl:variable name="staffAttrib">
                <xsl:copy-of select="print/staff-layout"/>
                <xsl:copy-of select="attributes/clef or divisions or key or staff-details[*] or
                  transpose"/>
              </xsl:variable>

              <!--<xsl:value-of select="$nl"/>
              <xsl:comment>StaffAttrib</xsl:comment>
              <xsl:value-of select="$nl"/>
              <xsl:copy-of select="$staffAttrib"/>-->

              <xsl:variable name="staffDefTemp">
                <xsl:for-each select="$defaultLayout//*[@xml:id=$partID]">
                  <staffDef>
                    <xsl:variable name="thisStaff">
                      <xsl:value-of select="position()"/>
                    </xsl:variable>
                    <xsl:copy-of select="@n"/>
                    <xsl:copy-of select="$staffAttrib/*[number(@number) = $thisStaff]"/>
                    <xsl:choose>
                      <xsl:when test="$thisStaff = 1">
                        <xsl:copy-of select="$staffAttrib/clef[not(@number)][1]"/>
                        <xsl:copy-of select="$staffAttrib/divisions"/>
                        <xsl:copy-of select="$staffAttrib/key[not(@number)][1]"/>
                        <xsl:copy-of select="$staffAttrib/staff-details[not(@number)][1]"/>
                        <xsl:copy-of select="$staffAttrib/staff-layout[not(@number)][1]"/>
                        <xsl:copy-of select="$staffAttrib/transpose"/>
                      </xsl:when>
                    </xsl:choose>
                  </staffDef>
                </xsl:for-each>
              </xsl:variable>

              <!--<xsl:value-of select="$nl"/>
              <xsl:comment>StaffDefTemp</xsl:comment>
              <xsl:value-of select="$nl"/>
              <xsl:copy-of select="$staffDefTemp"/>-->

              <xsl:for-each select="$staffDefTemp/staffDef[*]">
                <staffDef xmlns="http://www.music-encoding.org/ns/mei">
                  <xsl:copy-of select="@n"/>
                  <!-- staff lines -->
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
                  <!-- tuning for TAB staff -->
                  <xsl:if test="staff-details/staff-tuning">
                    <xsl:attribute name="tab.strings">
                      <xsl:variable name="tabstrings">
                        <xsl:for-each select="staff-details/staff-tuning">
                          <xsl:sort select="@line" order="descending"/>
                          <xsl:variable name="thisstring">
                            <xsl:value-of select="tuning-step"/>
                          </xsl:variable>
                          <xsl:value-of select="translate(tuning-step,'ABCDEFG','abcdefg')"/>
                          <xsl:value-of select="tuning-octave"/>
                          <xsl:text> </xsl:text>
                        </xsl:for-each>
                      </xsl:variable>
                      <xsl:value-of select="normalize-space($tabstrings)"/>
                    </xsl:attribute>
                  </xsl:if>
                  <!-- transposition via capo -->
                  <xsl:if test="staff-details/capo">
                    <xsl:attribute name="trans.semi">
                      <xsl:value-of select="staff-details[capo]/capo"/>
                    </xsl:attribute>
                  </xsl:if>
                  <!-- staff spacing -->
                  <xsl:for-each select="staff-layout/staff-distance">
                    <xsl:attribute name="spacing">
                      <xsl:value-of select="."/>
                    </xsl:attribute>
                  </xsl:for-each>
                  <!-- staff size -->
                  <xsl:for-each select="staff-details/staff-size">
                    <xsl:attribute name="scale">
                      <xsl:value-of select="."/>
                      <xsl:text>%</xsl:text>
                    </xsl:attribute>
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
                  <!-- ppq -->
                  <xsl:for-each select="divisions">
                    <xsl:if test="number(.) != $scorePPQ">
                      <xsl:attribute name="ppq">
                        <xsl:value-of select="."/>
                      </xsl:attribute>
                    </xsl:if>
                  </xsl:for-each>
                  <!-- staff key signature -->
                  <xsl:if test="key">
                    <xsl:variable name="keysig">
                      <xsl:value-of select="key/fifths"/>
                    </xsl:variable>
                    <xsl:if test="$keysig != $scoreFifths">
                      <xsl:choose>
                        <xsl:when test="number($keysig)=0">
                          <xsl:attribute name="key.sig">
                            <xsl:value-of select="$keysig"/>
                          </xsl:attribute>
                        </xsl:when>
                        <xsl:when test="number($keysig) &gt; 0">
                          <xsl:attribute name="key.sig"><xsl:value-of select="$keysig"
                            />s</xsl:attribute>
                        </xsl:when>
                        <xsl:when test="number($keysig) &lt; 0">
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
                </staffDef>
              </xsl:for-each>
            </xsl:when>
            <xsl:when test="local-name($defaultLayout//*[@xml:id=$partID]) = 'staffGrp'">
              <!-- Part has multiple staves -->
              <xsl:variable name="staffAttrib">
                <xsl:copy-of select="print/staff-layout"/>
                <xsl:copy-of select="attributes/clef or divisions or key or staff-details[*] or
                  transpose"/>
              </xsl:variable>
              <xsl:variable name="staffDefTemp">
                <xsl:for-each select="$defaultLayout//*[@xml:id=$partID]/*[local-name()='staffDef']">
                  <staffDef>
                    <xsl:variable name="thisStaff">
                      <xsl:value-of select="position()"/>
                    </xsl:variable>
                    <xsl:copy-of select="@n"/>
                    <xsl:copy-of select="$staffAttrib/*[number(@number) = $thisStaff]"/>
                    <xsl:choose>
                      <xsl:when test="$thisStaff = 1">
                        <xsl:copy-of select="$staffAttrib/clef[not(@number)][1]"/>
                        <xsl:copy-of select="$staffAttrib/divisions"/>
                        <xsl:copy-of select="$staffAttrib/key[not(@number)][1]"/>
                        <xsl:copy-of select="$staffAttrib/staff-details[not(@number)][1]"/>
                        <xsl:copy-of select="$staffAttrib/staff-layout[not(@number)][1]"/>
                        <xsl:copy-of select="$staffAttrib/transpose"/>
                      </xsl:when>
                    </xsl:choose>
                  </staffDef>
                </xsl:for-each>
              </xsl:variable>
              <xsl:for-each select="$staffDefTemp/staffDef[*]">
                <staffDef xmlns="http://www.music-encoding.org/ns/mei">
                  <xsl:copy-of select="@n"/>
                  <!-- staff lines -->
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
                  <!-- tuning for TAB staff -->
                  <xsl:if test="staff-details/staff-tuning">
                    <xsl:attribute name="tab.strings">
                      <xsl:variable name="tabstrings">
                        <xsl:for-each select="staff-details/staff-tuning">
                          <xsl:sort select="@line" order="descending"/>
                          <xsl:variable name="thisstring">
                            <xsl:value-of select="tuning-step"/>
                          </xsl:variable>
                          <xsl:value-of select="translate(tuning-step,'ABCDEFG','abcdefg')"/>
                          <xsl:value-of select="tuning-octave"/>
                          <xsl:text> </xsl:text>
                        </xsl:for-each>
                      </xsl:variable>
                      <xsl:value-of select="normalize-space($tabstrings)"/>
                    </xsl:attribute>
                  </xsl:if>
                  <!-- transposition via capo -->
                  <xsl:if test="staff-details/capo">
                    <xsl:attribute name="trans.semi">
                      <xsl:value-of select="staff-details[capo]/capo"/>
                    </xsl:attribute>
                  </xsl:if>
                  <!-- staff spacing -->
                  <xsl:for-each select="staff-layout/staff-distance">
                    <xsl:attribute name="spacing">
                      <xsl:value-of select="."/>
                    </xsl:attribute>
                  </xsl:for-each>
                  <!-- staff size -->
                  <xsl:for-each select="staff-details/staff-size">
                    <xsl:attribute name="scale">
                      <xsl:value-of select="."/>
                      <xsl:text>%</xsl:text>
                    </xsl:attribute>
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
                  <!-- ppq -->
                  <xsl:for-each select="divisions">
                    <xsl:if test="number(.) != $scorePPQ">
                      <xsl:attribute name="ppq">
                        <xsl:value-of select="."/>
                      </xsl:attribute>
                    </xsl:if>
                  </xsl:for-each>
                  <!-- staff key signature -->
                  <xsl:if test="key">
                    <xsl:variable name="keysig">
                      <xsl:value-of select="key/fifths"/>
                    </xsl:variable>
                    <xsl:if test="$keysig != $scoreFifths">
                      <xsl:choose>
                        <xsl:when test="number($keysig)=0">
                          <xsl:attribute name="key.sig">
                            <xsl:value-of select="$keysig"/>
                          </xsl:attribute>
                        </xsl:when>
                        <xsl:when test="number($keysig) &gt; 0">
                          <xsl:attribute name="key.sig"><xsl:value-of select="$keysig"
                            />s</xsl:attribute>
                        </xsl:when>
                        <xsl:when test="number($keysig) &lt; 0">
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
                </staffDef>
              </xsl:for-each>
            </xsl:when>
          </xsl:choose>
        </xsl:for-each>
      </xsl:if>

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
            <xsl:variable name="barstyle">
              <xsl:value-of select="following-sibling::measure[1]/part[1]/barline/bar-style"/>
            </xsl:variable>
            <xsl:choose>
              <xsl:when test="$barstyle='dotted'">
                <xsl:attribute name="right">dotted</xsl:attribute>
              </xsl:when>
              <xsl:when test="$barstyle='dashed'">
                <xsl:attribute name="right">dashed</xsl:attribute>
              </xsl:when>
              <xsl:when test="$barstyle='light-light'">
                <xsl:attribute name="right">dbl</xsl:attribute>
              </xsl:when>
              <xsl:when test="$barstyle='heavy-light'">
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
              <xsl:when test="$barstyle='light-heavy'">
                <xsl:choose>
                  <xsl:when test="part/barline/repeat/@direction='backward'">
                    <xsl:attribute name="right">rptend</xsl:attribute>
                  </xsl:when>
                  <xsl:otherwise>
                    <xsl:attribute name="right">end</xsl:attribute>
                  </xsl:otherwise>
                </xsl:choose>
              </xsl:when>
              <xsl:when test="$barstyle='heavy-heavy'">
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
              <xsl:when test="$barstyle='none'">
                <xsl:attribute name="right">invis</xsl:attribute>
              </xsl:when>
            </xsl:choose>
          </xsl:when>
          <!-- Set this measure's right attribute when the *following measure* doesn't have a left
            barline specified,  -->
          <xsl:when test="part/barline[@location='right']/bar-style">
            <xsl:variable name="barstyle">
              <xsl:value-of select="part[1]/barline/bar-style"/>
            </xsl:variable>
            <xsl:choose>
              <xsl:when test="$barstyle='dotted'">
                <xsl:attribute name="right">dotted</xsl:attribute>
              </xsl:when>
              <xsl:when test="$barstyle='dashed'">
                <xsl:attribute name="right">dashed</xsl:attribute>
              </xsl:when>
              <xsl:when test="$barstyle='light-light'">
                <xsl:attribute name="right">dbl</xsl:attribute>
              </xsl:when>
              <xsl:when test="$barstyle='light-heavy'">
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
              <xsl:when test="$barstyle='heavy-light'">
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
              <xsl:when test="$barstyle='heavy-heavy'">
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
              <xsl:when test="$barstyle='none'">
                <xsl:attribute name="right">invis</xsl:attribute>
              </xsl:when>
            </xsl:choose>
          </xsl:when>
          <!-- This stylesheet doesn't handle a barline in the middle of a measure -->
        </xsl:choose>

        <!-- Set left attribute -->
        <xsl:if test="part/barline[@location='left']/bar-style">
          <xsl:variable name="lbarstyle">
            <xsl:value-of select="part/barline/bar-style"/>
          </xsl:variable>
          <xsl:choose>
            <xsl:when test="$lbarstyle='dotted'">
              <xsl:attribute name="left">dotted</xsl:attribute>
            </xsl:when>
            <xsl:when test="$lbarstyle='dashed'">
              <xsl:attribute name="left">dashed</xsl:attribute>
            </xsl:when>
            <xsl:when test="$lbarstyle='light-light'">
              <xsl:attribute name="left">dbl</xsl:attribute>
            </xsl:when>
            <xsl:when test="$lbarstyle='light-heavy'">
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
            <xsl:when test="$lbarstyle='heavy-light'">
              <xsl:choose>
                <xsl:when test="part/barline/repeat/@direction='forward'">
                  <xsl:attribute name="left">rptstart</xsl:attribute>
                </xsl:when>
                <xsl:otherwise>
                  <xsl:attribute name="left">dbl</xsl:attribute>
                </xsl:otherwise>
              </xsl:choose>
            </xsl:when>
            <xsl:when test="$lbarstyle='heavy-heavy'">
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
            <xsl:when test="$lbarstyle='none'">
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
            <xsl:value-of select="@width"/>
          </xsl:attribute>
        </xsl:if>
      </measure>

      <!-- Hold the measure in $measure for later processing -->
      <!--<xsl:variable name="measure">
      <measure>
        <!-\- Measure attributes -\->
        <xsl:if test="@implicit='yes'">
          <xsl:attribute name="complete">i</xsl:attribute>
        </xsl:if>
        <!-\- DUCHEMIN - need alphanumeric measure numbers! -\->
        <xsl:attribute name="n">
          <xsl:value-of select="@number"/>
        </xsl:attribute>
        <!-\-<xsl:analyze-string select="normalize-space(@number)" regex="^([0-9]+)$">
          <xsl:matching-substring>
            <xsl:attribute name="n">
              <xsl:value-of select="regex-group(1)"/>
            </xsl:attribute>
          </xsl:matching-substring>
        </xsl:analyze-string>-\->
        <xsl:attribute name="xml:id">
          <xsl:value-of select="generate-id()"/>
        </xsl:attribute>
        <xsl:choose>
          <xsl:when
            test="following-sibling::measure[1]/part/barline[@location='left']/bar-style">
            <!-\- When the *following measure* has its left barline attribute set, also set the right
               attribute on *this* measure -\->
            <xsl:variable name="barstyle">
              <xsl:value-of
                select="following-sibling::measure[1]/part[1]/barline/bar-style"
              />
            </xsl:variable>
            <xsl:choose>
              <xsl:when test="$barstyle='dotted'">
                <xsl:attribute name="right">dotted</xsl:attribute>
              </xsl:when>
              <xsl:when test="$barstyle='dashed'">
                <xsl:attribute name="right">dashed</xsl:attribute>
              </xsl:when>
              <xsl:when test="$barstyle='light-light'">
                <xsl:attribute name="right">dbl</xsl:attribute>
              </xsl:when>
              <xsl:when test="$barstyle='heavy-light'">
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
              <xsl:when test="$barstyle='light-heavy'">
                <xsl:choose>
                  <xsl:when test="part/barline/repeat/@direction='backward'">
                    <xsl:attribute name="right">rptend</xsl:attribute>
                  </xsl:when>
                  <xsl:otherwise>
                    <xsl:attribute name="right">end</xsl:attribute>
                  </xsl:otherwise>
                </xsl:choose>
              </xsl:when>
              <xsl:when test="$barstyle='heavy-heavy'">
                <xsl:choose>
                  <xsl:when
                    test="part/barline/repeat/@direction='backward' and following-sibling::measure[1]/part/barline/repeat/@direction='forward'">
                    <xsl:attribute name="right">rptboth</xsl:attribute>
                  </xsl:when>
                  <xsl:otherwise>
                    <xsl:attribute name="right">dbl</xsl:attribute>
                  </xsl:otherwise>
                </xsl:choose>
              </xsl:when>
              <xsl:when test="$barstyle='none'">
                <xsl:attribute name="right">invis</xsl:attribute>
              </xsl:when>
            </xsl:choose>
          </xsl:when>
          <xsl:when test="part/barline[@location='right']/bar-style">
            <!-\- Set this measure's right attribute -\->
            <xsl:variable name="barstyle">
              <xsl:value-of select="part[1]/barline/bar-style"/>
            </xsl:variable>
            <xsl:choose>
              <xsl:when test="$barstyle='dotted'">
                <xsl:attribute name="right">dotted</xsl:attribute>
              </xsl:when>
              <xsl:when test="$barstyle='dashed'">
                <xsl:attribute name="right">dashed</xsl:attribute>
              </xsl:when>
              <xsl:when test="$barstyle='light-light'">
                <xsl:attribute name="right">dbl</xsl:attribute>
              </xsl:when>
              <xsl:when test="$barstyle='light-heavy'">
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
              <xsl:when test="$barstyle='heavy-light'">
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
              <xsl:when test="$barstyle='heavy-heavy'">
                <xsl:choose>
                  <xsl:when
                    test="part/barline/repeat[@direction='backward'] and following-sibling::measure[1]/part/barline/repeat[@direction='forward']">
                    <xsl:attribute name="right">rptboth</xsl:attribute>
                  </xsl:when>
                  <xsl:otherwise>
                    <xsl:attribute name="right">dbl</xsl:attribute>
                  </xsl:otherwise>
                </xsl:choose>
              </xsl:when>
              <xsl:when test="$barstyle='none'">
                <xsl:attribute name="right">invis</xsl:attribute>
              </xsl:when>
            </xsl:choose>
          </xsl:when>
          <!-\- This stylesheet doesn't handle a barline in the middle of a measure -\->
        </xsl:choose>

        <xsl:if test="part/barline[@location='left']/bar-style">
          <!-\- Set this measure's left attribute -\->
          <xsl:variable name="lbarstyle">
            <xsl:value-of select="part/barline/bar-style"/>
          </xsl:variable>
          <xsl:choose>
            <xsl:when test="$lbarstyle='dotted'">
              <xsl:attribute name="left">dotted</xsl:attribute>
            </xsl:when>
            <xsl:when test="$lbarstyle='dashed'">
              <xsl:attribute name="left">dashed</xsl:attribute>
            </xsl:when>
            <xsl:when test="$lbarstyle='light-light'">
              <xsl:attribute name="left">dbl</xsl:attribute>
            </xsl:when>
            <xsl:when test="$lbarstyle='light-heavy'">
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
            <xsl:when test="$lbarstyle='heavy-light'">
              <xsl:choose>
                <xsl:when test="part/barline/repeat/@direction='forward'">
                  <xsl:attribute name="left">rptstart</xsl:attribute>
                </xsl:when>
                <xsl:otherwise>
                  <xsl:attribute name="left">dbl</xsl:attribute>
                </xsl:otherwise>
              </xsl:choose>
            </xsl:when>
            <xsl:when test="$lbarstyle='heavy-heavy'">
              <xsl:choose>
                <xsl:when
                  test="part/barline/repeat/@direction='forward' and preceding-sibling::measure[1]/part/barline/repeat/@direction='backward'">
                  <xsl:attribute name="left">rptboth</xsl:attribute>
                </xsl:when>
                <xsl:otherwise>
                  <xsl:attribute name="left">dbl</xsl:attribute>
                </xsl:otherwise>
              </xsl:choose>
            </xsl:when>
            <xsl:when test="$lbarstyle='none'">
              <xsl:attribute name="left">invis</xsl:attribute>
            </xsl:when>
          </xsl:choose>
        </xsl:if>
        
        <!-\- Occasionally bar-style is not present, in which case: -\->
        <xsl:if test="part/barline[@location='left'][repeat]">
          <!-\- Set this measure's left attribute -\->
            <xsl:choose>
              <xsl:when test="part/barline/repeat/@direction='forward'">
                <xsl:attribute name="left">rptstart</xsl:attribute>
              </xsl:when>
              <xsl:when
                test="part/barline/repeat/@direction='forward' and preceding-sibling::measure[1]/part/barline/repeat/@direction='backward'">
                <xsl:attribute name="left">rptboth</xsl:attribute>
              </xsl:when>
            </xsl:choose>
        </xsl:if>
        
        <xsl:if test="part/barline[@location='right'][repeat]">
          <!-\- Set this measure's right attribute -\->
          <xsl:choose>
            <xsl:when test="part/barline/repeat/@direction='backward'">
              <xsl:attribute name="right">rptend</xsl:attribute>
            </xsl:when>
            <xsl:when
              test="part/barline/repeat/@direction='backward' and following-sibling::measure[1]/part/barline/repeat/@direction='forward'">
              <xsl:attribute name="right">rptboth</xsl:attribute>
            </xsl:when>
          </xsl:choose>
        </xsl:if>

        <xsl:if test="@width">
          <!-\- If it exists, grab the measure width -\->
          <xsl:attribute name="width">
            <xsl:value-of select="@width"/>
          </xsl:attribute>
        </xsl:if>

        <!-\- Process measure contents -\->
        <xsl:for-each select="part">
          <!-\- Events  -\->
          <xsl:for-each-group
            select="note[not(chord)]|backup|attributes|forward"
            group-ending-with="backup">
            <xsl:apply-templates select="current-group()" mode="stage1"/>
          </xsl:for-each-group>
        </xsl:for-each>

        <!-\-<xsl:for-each select="part">
          <!-\- Control events -\->
          <xsl:variable name="controlevents">
            <xsl:apply-templates select="note/notations/articulations/caesura"
              mode="stage1"/>
            <xsl:apply-templates select="note/notations/dynamics" mode="stage1"/>
            <xsl:apply-templates select="direction" mode="stage1"/>
            <xsl:apply-templates select="note/notations/tuplet[@type='start']"
              mode="stage1"/>
            <xsl:apply-templates
              select="note/notations/slur[@type='start' or @type='continue']"
              mode="stage1"/>
            <xsl:apply-templates select="note/notations/tied[@type='start']"
              mode="stage1"/>
            <xsl:apply-templates select="note/notations/fermata" mode="stage1"/>
            <xsl:apply-templates select="note/notations/ornaments" mode="stage1"/>
            <xsl:apply-templates
              select="note[not(chord) and notations/arpeggiate]" mode="arpeg"/>
            <xsl:apply-templates select="harmony" mode="stage1"/>
            <xsl:apply-templates
              select="note/notations/technical/pull-off[@type='start']"
              mode="stage1"/>
          </xsl:variable>
          <xsl:for-each select="$controlevents/*">
            <!-\- For ease of reading, sort the control events on the tstamp.ges attribute. -\->
            <xsl:sort select="@tstamp.ges" data-type="number"/>
            <xsl:copy-of select="."/>
          </xsl:for-each>
        </xsl:for-each>
      -\->
      </measure>
    </xsl:variable>
-->

      <!-- Further process $measure -->
      <!--<xsl:for-each select="$measure/measure">
      <measure>
        <xsl:copy-of select="@*"/>
        <!-\- Create temporary part elements for use in the step below -\->
        <xsl:for-each-group select="chord|clefchange|note|rest|space|mrest"
          group-by="@part">
          <xsl:variable name="partorg">
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

          <!-\- Further process $partorg: create staff and layer elements. -\->
          <xsl:variable name="stafforg">
            <xsl:for-each select="$partorg/part">
              <xsl:variable name="thispart">
                <xsl:value-of select="@n"/>
              </xsl:variable>
              <xsl:for-each select="layer">
                <xsl:variable name="thislayer">
                  <xsl:value-of select="@n"/>
                </xsl:variable>
                <xsl:variable name="staves">
                  <xsl:value-of select="distinct-values(*/@staff)"/>
                </xsl:variable>
                <xsl:variable name="countstaves">
                  <xsl:value-of select="count(distinct-values(*/@staff))"/>
                </xsl:variable>
                <xsl:choose>
                  <xsl:when test="$countstaves=1">
                    <!-\- The 'voice' lies on a single staff -\->
                    <xsl:for-each select="distinct-values(*/@staff)">
                      <staff>
                        <xsl:attribute name="n">
                          <xsl:value-of select="."/>
                        </xsl:attribute>
                        <xsl:copy-of
                          select="$partorg/part[@n=$thispart]/layer[@n=$thislayer]/*"
                        />
                      </staff>
                    </xsl:for-each>
                  </xsl:when>
                  <xsl:otherwise>
                    <!-\- The 'voice' crosses staves -\->
                    <xsl:for-each select="distinct-values(*/@staff)">
                      <xsl:variable name="thisstaff">
                        <xsl:value-of select="."/>
                      </xsl:variable>
                      <staff>
                        <xsl:attribute name="n">
                          <xsl:value-of select="$thisstaff"/>
                        </xsl:attribute>
                        <xsl:for-each
                          select="$partorg/part[@n=$thispart]/layer[@n=$thislayer]/*[name()='note' or name()='chord' or name()='rest' or name()='pad' or name()='space' or name()='clefchange']">
                          <!-\- Fill the unused time on 'the other staff' with space -\->
                          <xsl:choose>
                            <xsl:when test="@staff=$thisstaff">
                              <xsl:copy-of select="."/>
                            </xsl:when>
                            <xsl:otherwise>
                              <xsl:apply-templates select="." mode="insertspace"
                              />
                            </xsl:otherwise>
                          </xsl:choose>
                        </xsl:for-each>
                      </staff>
                    </xsl:for-each>
                  </xsl:otherwise>
                </xsl:choose>
              </xsl:for-each>
            </xsl:for-each>
          </xsl:variable>

          <!-\- Further process $stafforg: sort by staff, then by layer -\->
          <xsl:variable name="stafforg2">
            <xsl:for-each select="$stafforg/staff">
              <xsl:sort select="@n"/>
              <staff>
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

          <!-\- Further process $stafforg2: create beam elements -\->
          <xsl:variable name="stafforg3">
            <xsl:for-each-group select="$stafforg2/staff" group-by="@n">
              <xsl:variable name="thisstaff">
                <xsl:value-of select="current-grouping-key()"/>
              </xsl:variable>
              <xsl:variable name="stafflayer">
                <staff>
                  <xsl:copy-of select="@*"/>
                  <xsl:copy-of select="$stafforg2/staff[@n=$thisstaff]/layer"/>
                </staff>
              </xsl:variable>
              <xsl:for-each select="$stafflayer/staff">
                <staff>
                  <xsl:copy-of select="@*"/>
                  <xsl:for-each select="layer">
                    <xsl:sort select="@n"/>
                    <layer>
                      <xsl:copy-of select="@*[not(name()='n')]"/>
                      <xsl:attribute name="n">
                        <xsl:value-of select="position()"/>
                      </xsl:attribute>
                      <xsl:if test="*[@tstamp.ges][1]/@tstamp.ges != 0">
                        <!-\- If the 1st event in the layer doesn't have a timestamp of 0, insert space. -\->
                        <space>
                          <xsl:attribute name="xml:id">
                            <xsl:value-of
                              select="generate-id(*[@tstamp.ges][1]/@tstamp.ges)"
                            />
                          </xsl:attribute>
                          <xsl:attribute name="tstamp.ges">0</xsl:attribute>
                          <xsl:attribute name="dur.ges">
                            <xsl:value-of select="*[@tstamp.ges][1]/@tstamp.ges"
                            />
                          </xsl:attribute>
                        </space>
                      </xsl:if>
                      <xsl:for-each select="*">
                        <xsl:choose>
                          <xsl:when test="starts-with(@beam,'i')">
                            <xsl:text>&startbeam;</xsl:text>
                            <xsl:apply-templates select="." mode="dropattrs"/>
                          </xsl:when>
                          <xsl:when test="starts-with(@beam,'t')">
                            <xsl:apply-templates select="." mode="dropattrs"/>
                            <xsl:text>&endbeam;</xsl:text>
                          </xsl:when>
                          <xsl:otherwise>
                            <xsl:apply-templates select="." mode="dropattrs"/>
                          </xsl:otherwise>
                        </xsl:choose>
                      </xsl:for-each>
                    </layer>
                  </xsl:for-each>
                </staff>
              </xsl:for-each>
            </xsl:for-each-group>
          </xsl:variable>

          <!-\- Emit the final results -\->
          <xsl:copy-of select="$stafforg3"/>

        </xsl:for-each-group>

        <!-\- Copy controlevents -\->
        <xsl:copy-of
          select="annot|arpeg|beamspan|bend|dir|dynam|fermata|gliss|hairpin|
                  harm|lyrics|midi|mordent|octave|pedal|reh|slur|tempo|tie|
                  trill|tupletspan|turn"/>

        <!-\- Copy graphic primitives -\->
        <xsl:copy-of select="curve|line"/>

      </measure>
    </xsl:for-each>
  -->
    </xsl:if>

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

  <xsl:template name="credit">
    <anchoredText xmlns="http://www.music-encoding.org/ns/mei">
      <xsl:if test="../credit-type">
        <xsl:attribute name="n" select="replace(normalize-space(../credit-type), '\s', '_')"/>
      </xsl:if>
      <xsl:attribute name="x" select="@default-x"/>
      <xsl:attribute name="y" select="@default-y"/>
      <xsl:choose>
        <xsl:when test="contains(../credit-type, 'page number') or matches(normalize-space(.),
          '^[0-9]+$')">
          <xsl:processing-instruction name="pageNum"/>
        </xsl:when>
        <xsl:otherwise>
          <xsl:call-template name="textProperties1"/>
          <!--<xsl:apply-templates select="."/>-->
        </xsl:otherwise>
      </xsl:choose>
      <xsl:for-each select="following-sibling::credit-words[not(@default-y)]">
        <lb/>
        <xsl:choose>
          <xsl:when test="contains(../credit-type, 'page number') or matches(normalize-space(.),
            '^[0-9]+$')">
            <xsl:processing-instruction name="pageNum"/>
          </xsl:when>
          <xsl:otherwise>
            <xsl:call-template name="textProperties1"/>
            <!--<xsl:apply-templates select="."/>-->
          </xsl:otherwise>
        </xsl:choose>
      </xsl:for-each>
    </anchoredText>
  </xsl:template>

  <xsl:template name="credits">
    <xsl:variable name="pageHeight">
      <xsl:value-of select="defaults/page-layout/page-height"/>
    </xsl:variable>
    <xsl:if test="credit[number(@page)=1]/credit-words[@default-y &gt; ($pageHeight div 2)]">
      <pgHead xmlns="http://www.music-encoding.org/ns/mei">
        <xsl:for-each select="credit[number(@page)=1]/credit-words[@default-y &gt; ($pageHeight div
          2)]">
          <xsl:call-template name="credit"/>
        </xsl:for-each>
      </pgHead>
    </xsl:if>
    <xsl:if test="credit[number(@page)=1]/credit-words[@default-y &lt; ($pageHeight div 2)]">
      <pgFoot xmlns="http://www.music-encoding.org/ns/mei">
        <xsl:for-each select="credit[number(@page)=1]/credit-words[@default-y &lt; ($pageHeight div
          2)]">
          <xsl:call-template name="credit"/>
        </xsl:for-each>
      </pgFoot>
    </xsl:if>
    <xsl:if test="credit[number(@page)=2]/credit-words[@default-y &gt; ($pageHeight div 2)]">
      <pgHead2 xmlns="http://www.music-encoding.org/ns/mei">
        <xsl:for-each select="credit[number(@page)=2]/credit-words[@default-y &gt; ($pageHeight div
          2)]">
          <xsl:call-template name="credit"/>
        </xsl:for-each>
      </pgHead2>
    </xsl:if>
    <xsl:if test="credit[number(@page)=2]/credit-words[@default-y &lt; ($pageHeight div 2)]">
      <pgFoot2 xmlns="http://www.music-encoding.org/ns/mei">
        <xsl:for-each select="credit[number(@page)=2]/credit-words[@default-y &lt; ($pageHeight div
          2)]">
          <xsl:call-template name="credit"/>
        </xsl:for-each>
      </pgFoot2>
    </xsl:if>
  </xsl:template>

  <xsl:template name="getstaffnum">
    <!-- Assign a staff number from $defaultLayout -->
    <xsl:param name="partID">P1</xsl:param>
    <xsl:param name="partstaff">1</xsl:param>

    <!--<xsl:variable name="ingroup">
      <xsl:value-of
        select="$defaultLayout//staffGrp[@xml:id=$partID]/staffDef[position()=$partstaff]/@n"/>
    </xsl:variable>
    <xsl:variable name="indef">
      <xsl:value-of select="$defaultLayout//staffDef[@xml:id=$partID]/@n"/>
    </xsl:variable>
    <xsl:choose>
      <xsl:when test="$ingroup != ''">
        <xsl:value-of select="$ingroup"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="$indef"/>
      </xsl:otherwise>
    </xsl:choose>-->
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
    <xsl:choose>
      <xsl:when test="$staffNum = '' and
        following::measure[1]/part[@id=$partID]/print/staff-layout/staff-distance">
        <xsl:for-each
          select="following::measure[1]/part[@id=$partID]/print/staff-layout/staff-distance[1]">
          <xsl:attribute name="spacing">
            <xsl:value-of select="."/>
          </xsl:attribute>
        </xsl:for-each>
      </xsl:when>
      <xsl:otherwise>
        <xsl:for-each
          select="following::measure[1]/part[@id=$partID]/print/staff-layout[string(@number)=$staffNum]/staff-distance">
          <xsl:attribute name="spacing">
            <xsl:value-of select="$staffNum"/>
            <xsl:value-of select="."/>
          </xsl:attribute>
        </xsl:for-each>
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

  <xsl:template name="textProperties1">
    <xsl:choose>
      <xsl:when test="contains(@enclosure, 'square') or contains(@enclosure, 'rectangle') or
        contains(@enclosure, 'circle') or contains(@enclosure, 'oval')">
        <rend xmlns="http://www.music-encoding.org/ns/mei">
          <xsl:attribute name="rend">
            <xsl:choose>
              <xsl:when test="contains(@enclosure, 'square') or contains(@enclosure, 'rectangle')">
                <xsl:text>box</xsl:text>
              </xsl:when>
              <xsl:when test="contains(@enclosure, 'circle') or contains(@enclosure, 'oval')">
                <xsl:text>circle</xsl:text>
              </xsl:when>
            </xsl:choose>
          </xsl:attribute>
          <xsl:choose>
            <xsl:when
              test="@font-family|@font-style|@font-size|@font-weight|@justify|@halign|@valign|@color|@underline">
              <xsl:call-template name="textProperties2"/>
            </xsl:when>
            <xsl:when test="@line-through">
              <xsl:call-template name="textProperties3"/>
            </xsl:when>
            <xsl:otherwise>
              <xsl:value-of select="normalize-space(.)"/>
            </xsl:otherwise>
          </xsl:choose>
        </rend>
      </xsl:when>
      <xsl:when
        test="@font-family|@font-style|@font-size|@font-weight|@justify|@halign|@valign|@color|@underline">
        <xsl:call-template name="textProperties2"/>
      </xsl:when>
      <xsl:when test="@line-through ">
        <xsl:call-template name="textProperties3"/>
      </xsl:when>
    </xsl:choose>
  </xsl:template>

  <xsl:template name="textProperties2">
    <xsl:choose>
      <xsl:when
        test="@font-family|@font-style|@font-size|@font-weight|@justify|@halign|@valign|@color|@underline">
        <rend xmlns="http://www.music-encoding.org/ns/mei">
          <xsl:if test="@font-family">
            <xsl:attribute name="fontfam">
              <xsl:value-of select="normalize-space(@font-family)"/>
            </xsl:attribute>
          </xsl:if>
          <xsl:if test="@font-style">
            <xsl:attribute name="fontstyle">
              <xsl:choose>
                <xsl:when test="lower-case(substring(normalize-space(@font-style),1,4))='ital'">
                  <xsl:text>ital</xsl:text>
                </xsl:when>
                <xsl:otherwise>
                  <xsl:value-of select="normalize-space(@font-style)"/>
                </xsl:otherwise>
              </xsl:choose>
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
              <xsl:attribute name="color">
                <xsl:value-of select="normalize-space(@color)"/>
              </xsl:attribute>
            </xsl:when>
          </xsl:choose>
          <xsl:if test="@underline">
            <xsl:attribute name="rend">
              <xsl:text>underline</xsl:text>
            </xsl:attribute>
          </xsl:if>
          <xsl:choose>
            <xsl:when test="@line-through ">
              <xsl:call-template name="textProperties3"/>
            </xsl:when>
            <xsl:otherwise>
              <xsl:value-of select="normalize-space(.)"/>
            </xsl:otherwise>
          </xsl:choose>
        </rend>
      </xsl:when>
      <xsl:when test="@line-through ">
        <xsl:call-template name="textProperties3"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="normalize-space(.)"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template name="textProperties3">
    <xsl:choose>
      <xsl:when test="@line-through ">
        <rend xmlns="http://www.music-encoding.org/ns/mei">
          <xsl:attribute name="rend">
            <xsl:text>strike</xsl:text>
          </xsl:attribute>
          <xsl:value-of select="normalize-space(.)"/>
        </rend>
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="normalize-space(.)"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

</xsl:stylesheet>
