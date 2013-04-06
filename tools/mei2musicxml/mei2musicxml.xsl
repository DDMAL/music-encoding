<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"
  xmlns:mei="http://www.music-encoding.org/ns/mei" exclude-result-prefixes="mei">
  <xsl:output method="xml" indent="yes" encoding="UTF-8" omit-xml-declaration="no" standalone="no"
    doctype-system="file:/H:/MusicXML_dtd/timewise.dtd"/>
  <!--<xsl:output method="xml" indent="yes" encoding="UTF-8" omit-xml-declaration="no" standalone="no"
    doctype-system="http://www.musicxml.org/dtds/timewise.dtd" doctype-public="-//Recordare//DTD
    MusicXML 2.0 Timewise//EN"/>-->
  <xsl:strip-space elements="*"/>

  <!-- global variables -->
  <xsl:variable name="nl">
    <xsl:text>&#xa;</xsl:text>
  </xsl:variable>
  <xsl:variable name="progName">
    <xsl:text>mei2musicxml</xsl:text>
  </xsl:variable>
  <xsl:variable name="progVersion">
    <xsl:text>v. 0.1</xsl:text>
  </xsl:variable>

  <!-- 'Match' templates -->
  <xsl:template match="/">
    <xsl:choose>
      <xsl:when test="mei:mei">
        <xsl:apply-templates select="mei:mei"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:variable name="errorMessage">The source file is not an MEI file!</xsl:variable>
        <xsl:message terminate="yes">
          <xsl:value-of select="normalize-space($errorMessage)"/>
        </xsl:message>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template match="mei:mei">
    <score-timewise>
      <xsl:apply-templates select="mei:meiHead"/>
      <xsl:apply-templates select="mei:music/mei:body/mei:mdiv/mei:score/mei:scoreDef"
        mode="defaults"/>
      <xsl:apply-templates select="mei:music/mei:body/mei:mdiv/mei:score/mei:scoreDef"
        mode="credits"/>
      <xsl:value-of select="$nl"/>
      <xsl:apply-templates select="mei:music/mei:body/mei:mdiv/mei:score/mei:scoreDef/mei:staffGrp"
        mode="partList"/>
      <xsl:for-each select="mei:music/mei:body/mei:mdiv/mei:score//mei:measure">
        <measure>
          <xsl:if test="@n">
            <xsl:attribute name="number">
              <xsl:value-of select="@n"/>
            </xsl:attribute>
          </xsl:if>
          <xsl:if test="@width">
            <xsl:attribute name="width">
              <xsl:value-of select="@width * 5"/>
            </xsl:attribute>
          </xsl:if>
          <xsl:variable name="measureContent">
            <xsl:for-each select="mei:staff/mei:layer/*">
              <xsl:variable name="name">
                <xsl:value-of select="local-name()"/>
              </xsl:variable>
              <xsl:variable name="thisStaff">
                <xsl:value-of select="ancestor::mei:staff/@n"/>
              </xsl:variable>
              <xsl:copy>
                <xsl:copy-of select="@*"/>
                <xsl:attribute name="partID">
                  <xsl:choose>
                    <xsl:when
                      test="preceding::mei:scoreDef[mei:staffGrp][1]/mei:staffGrp/mei:staffDef[@n=$thisStaff]">
                      <xsl:choose>
                        <xsl:when
                          test="preceding::mei:scoreDef[mei:staffGrp][1]/mei:staffGrp/mei:staffDef[@n=$thisStaff]/@xml:id">
                          <xsl:value-of
                            select="preceding::mei:scoreDef[mei:staffGrp][1]/mei:staffGrp/mei:staffDef[@n=$thisStaff]/@xml:id"
                          />
                        </xsl:when>
                        <xsl:otherwise>
                          <xsl:text>P_</xsl:text>
                          <xsl:value-of
                            select="generate-id(preceding::mei:scoreDef[mei:staffGrp][1]/mei:staffGrp/mei:staffDef[@n=$thisStaff])"
                          />
                        </xsl:otherwise>
                      </xsl:choose>
                    </xsl:when>
                    <xsl:when
                      test="preceding::mei:scoreDef[mei:staffGrp][1]/mei:staffGrp/mei:staffGrp[mei:staffDef[@n=$thisStaff]]">
                      <xsl:choose>
                        <xsl:when
                          test="preceding::mei:scoreDef[mei:staffGrp][1]/mei:staffGrp/mei:staffGrp[mei:staffDef[@n=$thisStaff]]/@xml:id">
                          <xsl:value-of
                            select="preceding::mei:scoreDef[mei:staffGrp][1]/mei:staffGrp/mei:staffGrp[mei:staffDef[@n=$thisStaff]]/@xml:id"
                          />
                        </xsl:when>
                        <xsl:otherwise>
                          <xsl:text>P_</xsl:text>
                          <xsl:value-of
                            select="generate-id(preceding::mei:scoreDef[mei:staffGrp][1]/mei:staffGrp/mei:staffGrp[mei:staffDef[@n=$thisStaff]])"
                          />
                        </xsl:otherwise>
                      </xsl:choose>
                    </xsl:when>
                  </xsl:choose>
                </xsl:attribute>
                <xsl:attribute name="meiStaff">
                  <xsl:value-of select="ancestor::mei:staff/@n"/>
                </xsl:attribute>
                <xsl:if test="not(@staff)">
                  <xsl:attribute name="staff">
                    <xsl:value-of select="ancestor::mei:staff/@n"/>
                  </xsl:attribute>
                </xsl:if>
                <xsl:attribute name="voice">
                  <xsl:value-of select="ancestor::mei:layer/@n"/>
                </xsl:attribute>
                <xsl:copy-of select="mei:*"/>
              </xsl:copy>
            </xsl:for-each>
          </xsl:variable>
          <!--<xsl:copy-of select="$measureContent"/>-->
          <xsl:for-each-group select="$measureContent/*" group-by="@partID">
            <part id="{@partID}">
              <xsl:for-each-group select="current-group()" group-by="@voice">
                <voice>
                  <xsl:attribute name="n">
                    <xsl:value-of select="current-grouping-key()"/>
                  </xsl:attribute>
                  <xsl:for-each-group select="current-group()" group-by="@meiStaff">
                    <staff>
                      <xsl:attribute name="n">
                        <xsl:value-of select="current-grouping-key()"/>
                      </xsl:attribute>
                      <xsl:copy-of select="current-group()"/>
                    </staff>
                  </xsl:for-each-group>

                  <!--<xsl:apply-templates select="current-group()"/>-->
                  <!--<xsl:copy-of select="current-group()"/>-->
                </voice>
              </xsl:for-each-group>
            </part>
          </xsl:for-each-group>
        </measure>
      </xsl:for-each>
    </score-timewise>
  </xsl:template>

  <xsl:template match="mei:note">
    <xsl:if test="@tstamp.ges &lt; preceding-sibling::mei:*[@tstamp.ges][1]/@tstamp.ges">
      <backup/>
    </xsl:if>
    <note>
      <xsl:if test="ancestor::mei:chord">
        <chord/>
      </xsl:if>
    </note>
  </xsl:template>

  <xsl:template match="mei:chord">
    <xsl:if test="@tstamp.ges &lt; preceding-sibling::mei:*[@tstamp.ges][1]/@tstamp.ges">
      <backup/>
    </xsl:if>
    <xsl:for-each select="mei:note">
      <note>
        <xsl:if test="position() &gt; 1">
          <chord/>
        </xsl:if>
      </note>
    </xsl:for-each>
  </xsl:template>

  <xsl:template match="mei:rest | mei:mRest | mei:space | mei:mSpace">
    <xsl:if test="@tstamp.ges &lt; preceding-sibling::mei:*[@tstamp.ges][1]/@tstamp.ges">
      <backup/>
    </xsl:if>
    <note>
      <rest>
        <xsl:if test="local-name()='mRest' or local-name()='mSpace'">
          <xsl:attribute name="measure">
            <xsl:text>yes</xsl:text>
          </xsl:attribute>
        </xsl:if>
      </rest>
    </note>
  </xsl:template>

  <xsl:template match="mei:staffGrp" mode="partList">
    <part-list>
      <xsl:for-each select="mei:staffDef | mei:staffGrp">
        <score-part>
          <xsl:attribute name="id">
            <xsl:choose>
              <xsl:when test="@xml:id">
                <xsl:value-of select="@xml:id"/>
              </xsl:when>
              <xsl:otherwise>
                <xsl:text>P_</xsl:text>
                <xsl:value-of select="generate-id()"/>
              </xsl:otherwise>
            </xsl:choose>
          </xsl:attribute>
          <part-name>
            <xsl:value-of select="@label"/>
          </part-name>
          <xsl:if test="mei:instrDef">
            <score-instrument>
              <xsl:attribute name="id">
                <xsl:choose>
                  <xsl:when test="mei:instrDef/@xml:id">
                    <xsl:value-of select="mei:instrDef/@xml:id"/>
                  </xsl:when>
                  <xsl:otherwise>
                    <xsl:text>I</xsl:text>
                    <xsl:value-of select="generate-id(mei:instrDef)"/>
                  </xsl:otherwise>
                </xsl:choose>
              </xsl:attribute>
              <instrument-name>
                <xsl:value-of select="replace(mei:instrDef/@midi.instrname, '_', '&#32;')"/>
              </instrument-name>
            </score-instrument>
            <midi-instrument>
              <xsl:attribute name="id">
                <xsl:choose>
                  <xsl:when test="mei:instrDef/@xml:id">
                    <xsl:value-of select="mei:instrDef/@xml:id"/>
                  </xsl:when>
                  <xsl:otherwise>
                    <xsl:text>I</xsl:text>
                    <xsl:value-of select="generate-id(mei:instrDef)"/>
                  </xsl:otherwise>
                </xsl:choose>

              </xsl:attribute>
              <midi-channel>
                <xsl:value-of select="mei:instrDef/@midi.channel"/>
              </midi-channel>
              <midi-program>
                <!-- MusicXML uses 1-based program numbers -->
                <xsl:value-of select="mei:instrDef/@midi.instrnum + 1"/>
              </midi-program>
              <volume>
                <!-- MusicXML uses scaling factor instead of actual MIDI value -->
                <xsl:value-of select="round((mei:instrDef/@midi.volume * 100) div 127)"/>
              </volume>
              <pan>
                <!-- Placement within stereo sound field (left=0, right=127) -->
                <xsl:choose>
                  <xsl:when test="mei:instrDef/@midi.pan = 63 or mei:instrDef/@midi.pan = 64">
                    <xsl:value-of select="0"/>
                  </xsl:when>
                  <xsl:otherwise>
                    <xsl:value-of select="round(-90 + ((180 div 127) * mei:instrDef/@midi.pan))"/>
                  </xsl:otherwise>
                </xsl:choose>
              </pan>
            </midi-instrument>
          </xsl:if>
        </score-part>
      </xsl:for-each>
    </part-list>
  </xsl:template>

  <xsl:template match="mei:scoreDef" mode="credits">
    <xsl:apply-templates select="mei:pgHead | mei:pgFoot | mei:pgHead2 | mei:pgFoot2"/>
  </xsl:template>

  <xsl:template match="mei:pgHead | mei:pgFoot | mei:pgHead2 | mei:pgFoot2">
    <xsl:choose>
      <xsl:when test="mei:anchoredText">
        <xsl:apply-templates select="mei:anchoredText"/>
      </xsl:when>
      <xsl:otherwise>
        <credit>
          <xsl:attribute name="page">
            <xsl:choose>
              <xsl:when test="ancestor-or-self::mei:pgHead or ancestor-or-self::mei:pgFoot">
                <xsl:value-of select="1"/>
              </xsl:when>
              <xsl:when test="ancestor-or-self::mei:pgHead2 or ancestor-or-self::mei:pgFoot2">
                <xsl:value-of select="2"/>
              </xsl:when>
            </xsl:choose>
          </xsl:attribute>
          <xsl:for-each select="mei:rend">
            <credit-words>
              <xsl:call-template name="rendition"/>
              <xsl:value-of select="normalize-space(.)"/>
            </credit-words>
          </xsl:for-each>
        </credit>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template match="mei:anchoredText">
    <credit>
      <xsl:attribute name="page">
        <xsl:choose>
          <xsl:when test="ancestor::mei:pgHead or ancestor::mei:pgFoot">
            <xsl:value-of select="1"/>
          </xsl:when>
          <xsl:when test="ancestor::mei:pgHead2 or ancestor::mei:pgFoot2">
            <xsl:value-of select="2"/>
          </xsl:when>
        </xsl:choose>
      </xsl:attribute>
      <xsl:if test="@n">
        <credit-type>
          <xsl:value-of select="@n"/>
        </credit-type>
      </xsl:if>
      <xsl:variable name="default-x">
        <xsl:value-of select="@x"/>
      </xsl:variable>
      <xsl:variable name="default-y">
        <xsl:value-of select="@y"/>
      </xsl:variable>
      <xsl:for-each-group select="mei:*" group-ending-with="mei:lb">
        <credit-words>
          <xsl:if test="position() = 1">
            <xsl:if test="ancestor::mei:anchoredText/@x">
              <xsl:attribute name="default-x">
                <xsl:value-of select="ancestor::mei:anchoredText/@x * 5"/>
              </xsl:attribute>
            </xsl:if>
            <xsl:if test="ancestor::mei:anchoredText/@y">
              <xsl:attribute name="default-y">
                <xsl:value-of select="ancestor::mei:anchoredText/@y * 5"/>
              </xsl:attribute>
            </xsl:if>
          </xsl:if>
          <xsl:call-template name="rendition"/>
          <xsl:variable name="creditText">
            <xsl:for-each select="current-group()">
              <xsl:value-of select="."/>
              <xsl:if test="position() != last()">
                <xsl:text>&#32;</xsl:text>
              </xsl:if>
            </xsl:for-each>
          </xsl:variable>
          <xsl:value-of select="normalize-space($creditText)"/>
        </credit-words>
      </xsl:for-each-group>
    </credit>
  </xsl:template>

  <xsl:template name="rendition">
    <xsl:copy-of select="@halign | @rotation | @valign | @xml:lang | @xml:space"/>
    <!-- color has to be converted to AARRGGBB -->
    <xsl:if test="@fontfam">
      <xsl:attribute name="font-family">
        <xsl:value-of select="@fontfam"/>
      </xsl:attribute>
    </xsl:if>
    <xsl:if test="@fontsize">
      <xsl:attribute name="font-size">
        <xsl:value-of select="@fontsize"/>
      </xsl:attribute>
    </xsl:if>
    <xsl:if test="@fontstyle">
      <xsl:attribute name="font-style">
        <xsl:value-of select="@fontstyle"/>
      </xsl:attribute>
    </xsl:if>
    <xsl:if test="@fontweight">
      <xsl:attribute name="font-weight">
        <xsl:value-of select="@fontweight"/>
      </xsl:attribute>
    </xsl:if>
    <xsl:if test="@rend">
      <xsl:analyze-string select="@rend" regex="\s+">
        <xsl:non-matching-substring>
          <xsl:message>
            <xsl:value-of select="."/>
          </xsl:message>
          <xsl:choose>
            <xsl:when test="matches(., '^underline$')">
              <xsl:attribute name="underline">
                <xsl:value-of select="1"/>
              </xsl:attribute>
            </xsl:when>
            <xsl:when test="matches(., 'underline\(\d+\)')">
              <xsl:attribute name="underline">
                <xsl:value-of select="replace(., '.*\((\d+)\)', '$1')"/>
              </xsl:attribute>
            </xsl:when>
            <xsl:when test="matches(., '^overline$')">
              <xsl:attribute name="overline">
                <xsl:value-of select="1"/>
              </xsl:attribute>
            </xsl:when>
            <xsl:when test="matches(., 'overline\(\d+\)')">
              <xsl:attribute name="overline">
                <xsl:value-of select="replace(., '.*\((\d+)\)', '$1')"/>
              </xsl:attribute>
            </xsl:when>
            <xsl:when test="matches(., '^(line-through|strike)$')">
              <xsl:attribute name="line-through">
                <xsl:value-of select="1"/>
              </xsl:attribute>
            </xsl:when>
            <xsl:when test="matches(., '(line-through|strike)\(\d+\)')">
              <xsl:attribute name="line-through">
                <xsl:value-of select="replace(., '.*\((\d+)\)', '$1')"/>
              </xsl:attribute>
            </xsl:when>
            <xsl:when test="matches(., 'letter-spacing\((\+|-)?\d+(\.\d+)?\)')">
              <xsl:attribute name="letter-spacing">
                <xsl:value-of select="replace(., '.*\(((\+|-)?\d+(\.\d+)?)\)', '$1')"/>
              </xsl:attribute>
            </xsl:when>
            <xsl:when test="matches(., 'line-height\((\+|-)?\d+(\.\d+)?\)')">
              <xsl:attribute name="line-height">
                <xsl:value-of select="replace(., '.*\(((\+|-)?\d+(\.\d+)?)\)', '$1')"/>
              </xsl:attribute>
            </xsl:when>
            <xsl:when test="matches(., '(bold|bolder)')">
              <xsl:attribute name="font-weight">
                <xsl:text>bold</xsl:text>
              </xsl:attribute>
            </xsl:when>
            <xsl:when test="matches(., '(box|circle|dbox|tbox)')">
              <xsl:attribute name="enclosure">
                <xsl:value-of select="replace(replace(replace(replace(., 'box', 'rectangle'),
                  'circle', 'circle'), 'dbox', 'diamond'), 'tbox', 'triangle')"/>
              </xsl:attribute>
            </xsl:when>
            <xsl:when test="matches(., '(lro|ltr|rlo|rtl)')">
              <xsl:attribute name="dir">
                <xsl:value-of select="."/>
              </xsl:attribute>
            </xsl:when>
            <xsl:when test="matches(.,
              '(large|medium|small|x-large|x-small|xx-large|xx-small)')">
              <xsl:attribute name="font-size">
                <xsl:value-of select="."/>
              </xsl:attribute>
            </xsl:when>
            <xsl:when test="matches(., 'italic')">
              <xsl:attribute name="font-style">
                <xsl:value-of select="."/>
              </xsl:attribute>
            </xsl:when>
            <xsl:when test="matches(., 'none')">
              <xsl:attribute name="print-object">
                <xsl:text>no</xsl:text>
              </xsl:attribute>
            </xsl:when>
          </xsl:choose>
        </xsl:non-matching-substring>
      </xsl:analyze-string>
    </xsl:if>
  </xsl:template>

  <xsl:template match="mei:scoreDef" mode="defaults">
    <xsl:if test="@vu.height | @page.height | @page.width | @page.leftmar | @page.rightmar |
      @page.topmar | @page.botmar  | @system.leftmar | @system.rightmar | @system.topmar |
      @spacing.system | @spacing.staff | @music.name | @text.name | @lyric.name">
      <defaults>
        <xsl:if test="@vu.height">
          <scaling>
            <millimeters>
              <xsl:value-of select="number(replace(@vu.height, '[a-z]+$', '')) * 8"/>
            </millimeters>
            <tenths>40</tenths>
          </scaling>
        </xsl:if>
        <xsl:if test="@page.height | @page.width | @page.leftmar | @page.rightmar | @page.topmar |
          @page.botmar ">
          <page-layout>
            <page-height>
              <xsl:value-of select="number(replace(@page.height, '[a-z]+$', '')) * 5"/>
            </page-height>
            <page-width>
              <xsl:value-of select="number(replace(@page.width, '[a-z]+$', '')) * 5"/>
            </page-width>
            <page-margins type="both">
              <left-margin>
                <xsl:value-of select="number(replace(@page.leftmar, '[a-z]+$', '')) * 5"/>
              </left-margin>
              <right-margin>
                <xsl:value-of select="number(replace(@page.rightmar, '[a-z]+$', '')) * 5"/>
              </right-margin>
              <top-margin>
                <xsl:value-of select="number(replace(@page.topmar, '[a-z]+$', '')) * 5"/>
              </top-margin>
              <bottom-margin>
                <xsl:value-of select="number(replace(@page.botmar, '[a-z]+$', '')) * 5"/>
              </bottom-margin>
            </page-margins>
          </page-layout>
        </xsl:if>
        <xsl:if test="@system.leftmar | @system.rightmar | @system.topmar | @spacing.system">
          <system-layout>
            <system-margins>
              <left-margin>
                <xsl:value-of select="number(replace(@system.leftmar, '[a-z]+$', '')) * 5"/>
              </left-margin>
              <right-margin>
                <xsl:value-of select="number(replace(@system.rightmar, '[a-z]+$', '')) * 5"/>
              </right-margin>
            </system-margins>
            <system-distance>
              <xsl:value-of select="number(replace(@spacing.system, '[a-z]+$', '')) * 5"/>
            </system-distance>
            <top-system-distance>
              <xsl:value-of select="number(replace(@system.topmar, '[a-z]+$', '')) * 5"/>
            </top-system-distance>
          </system-layout>
        </xsl:if>
        <xsl:if test="@spacing.staff">
          <staff-layout>
            <staff-distance>
              <xsl:value-of select="number(replace(@spacing.staff, '[a-z]+$', '')) * 5"/>
            </staff-distance>
          </staff-layout>
        </xsl:if>
        <xsl:if test="@music.name | @text.name | @lyric.name">
          <music-font font-family="{@music.name}" font-size="{@music.size}"/>
          <word-font font-family="{@text.name}" font-size="{@text.size}"/>
          <lyric-font font-family="{@lyric.name}" font-size="{@lyric.size}"/>
        </xsl:if>
      </defaults>
    </xsl:if>
  </xsl:template>

  <xsl:template match="mei:meiHead">
    <xsl:apply-templates select="mei:workDesc/mei:work"/>
  </xsl:template>

  <xsl:template match="mei:work">
    <work>
      <xsl:for-each select="mei:titleStmt/mei:title/mei:identifier">
        <work-number>
          <xsl:value-of select="."/>
        </work-number>
      </xsl:for-each>
      <xsl:variable name="workTitle">
        <xsl:choose>
          <xsl:when test="mei:titleStmt/mei:title[@type='uniform']">
            <xsl:for-each select="mei:titleStmt/mei:title[@type='uniform']/text()">
              <xsl:value-of select="."/>
              <xsl:if test="position() != last()">
                <xsl:text>,&#32;</xsl:text>
              </xsl:if>
            </xsl:for-each>
          </xsl:when>
          <xsl:when test="mei:titleStmt/mei:title">
            <xsl:for-each select="mei:titleStmt/mei:title[not(@type='uniform')]/text()">
              <xsl:value-of select="."/>
              <xsl:if test="position() != last()">
                <xsl:text>,&#32;</xsl:text>
              </xsl:if>
            </xsl:for-each>
          </xsl:when>
        </xsl:choose>
      </xsl:variable>
      <work-title>
        <xsl:value-of select="replace($workTitle, ', $', '')"/>
      </work-title>
    </work>
    <identification>
      <xsl:choose>
        <xsl:when test="mei:titleStmt/mei:respStmt/mei:resp">
          <xsl:for-each select="mei:titleStmt/mei:respStmt/mei:resp">
            <creator>
              <xsl:attribute name="type">
                <xsl:value-of select="."/>
              </xsl:attribute>
              <xsl:value-of select="following-sibling::mei:name[1]"/>
            </creator>
          </xsl:for-each>
        </xsl:when>
        <xsl:when test="mei:titleStmt/mei:respStmt[mei:name or mei:persName or mei:corpName]">
          <xsl:for-each select="mei:titleStmt/mei:respStmt">
            <xsl:for-each select="mei:name | mei:persName | mei:corpName">
              <creator>
                <xsl:attribute name="type">
                  <xsl:value-of select="@role"/>
                </xsl:attribute>
                <xsl:value-of select="."/>
              </creator>
            </xsl:for-each>
          </xsl:for-each>
        </xsl:when>
      </xsl:choose>
      <xsl:apply-templates select="ancestor::mei:meiHead/mei:fileDesc/mei:pubStmt/mei:availability"/>
      <encoding>
        <software>
          <xsl:value-of select="$progName"/>
          <xsl:text>&#32;stylesheet&#32;</xsl:text>
          <xsl:value-of select="$progVersion"/>
        </software>
        <encoding-date>
          <xsl:value-of select="format-date(current-date(), '[Y]-[M02]-[D02]')"/>
        </encoding-date>
      </encoding>
      <source>
        <xsl:apply-templates select="ancestor::mei:meiHead/mei:fileDesc" mode="source"/>
      </source>
    </identification>
  </xsl:template>

  <xsl:template match="mei:fileDesc" mode="source">
    <xsl:for-each select="mei:titleStmt">
      <xsl:variable name="creators">
        <xsl:for-each select="mei:respStmt/*[@role='creator' or @role='composer' or
          @role='lyricist' or @role='arranger']">
          <xsl:value-of select="."/>
          <xsl:if test="position() != last()">
            <xsl:text>,&#32;</xsl:text>
          </xsl:if>
        </xsl:for-each>
      </xsl:variable>
      <xsl:variable name="encoders">
        <xsl:for-each select="mei:respStmt/*[@role='encoder']">
          <xsl:value-of select="."/>
          <xsl:if test="position() != last()">
            <xsl:text>,&#32;</xsl:text>
          </xsl:if>
        </xsl:for-each>
      </xsl:variable>
      <xsl:variable name="title">
        <xsl:for-each select="mei:title">
          <xsl:value-of select="."/>
          <xsl:if test="position() != last()">
            <xsl:text>,&#32;</xsl:text>
          </xsl:if>
        </xsl:for-each>
      </xsl:variable>
      <xsl:if test="normalize-space($creators) != ''">
        <xsl:value-of select="normalize-space($creators)"/>
        <xsl:text>.&#32;</xsl:text>
      </xsl:if>
      <xsl:if test="normalize-space($title) != ''">
        <xsl:value-of select="normalize-space($title)"/>
        <xsl:text>.&#32;</xsl:text>
      </xsl:if>
      <xsl:if test="normalize-space($encoders) != ''">
        <xsl:text>Encoded by&#32;</xsl:text>
        <xsl:value-of select="normalize-space($encoders)"/>
        <xsl:text>.&#32;</xsl:text>
      </xsl:if>
    </xsl:for-each>
    <xsl:for-each select="mei:pubStmt">
      <xsl:variable name="publisher">
        <xsl:for-each select="mei:respStmt[1]/mei:*">
          <xsl:value-of select="."/>
          <xsl:if test="position() != last()">
            <xsl:text>,&#32;</xsl:text>
          </xsl:if>
        </xsl:for-each>
      </xsl:variable>
      <xsl:variable name="pubPlace">
        <xsl:for-each select="mei:address[1]/mei:addrLine">
          <xsl:value-of select="."/>
          <xsl:if test="position() != last()">
            <xsl:text>,&#32;</xsl:text>
          </xsl:if>
        </xsl:for-each>
      </xsl:variable>
      <xsl:variable name="pubDate">
        <xsl:value-of select="mei:date[1]"/>
      </xsl:variable>
      <xsl:if test="normalize-space($publisher) != ''">
        <xsl:value-of select="normalize-space($publisher)"/>
      </xsl:if>
      <xsl:if test="normalize-space($pubPlace) != ''">
        <xsl:text>:&#32;</xsl:text>
        <xsl:value-of select="normalize-space($pubPlace)"/>
      </xsl:if>
      <xsl:if test="normalize-space($pubDate) != ''">
        <xsl:text>,&#32;</xsl:text>
        <xsl:value-of select="$pubDate"/>
        <xsl:text>.</xsl:text>
      </xsl:if>
    </xsl:for-each>
  </xsl:template>

  <xsl:template match="mei:availability">
    <xsl:if test="mei:useRestrict">
      <rights>
        <xsl:text>This encoding is in the public domain.</xsl:text>
        <!--<xsl:value-of select="mei:useRestrict"/>-->
      </rights>
    </xsl:if>
  </xsl:template>

</xsl:stylesheet>
