<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
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
    <music>
      <!--<music xmlns="http://www.music-encoding.org/ns/mei">-->
      <body>
        <mdiv>
          <score>
            <scoreDef>
              <xsl:copy-of select="$defaultLayout"/>
            </scoreDef>
          </score>
        </mdiv>
      </body>
    </music>
  </xsl:template>

  <xsl:template match="part-list" mode="layout">
    <!-- outerStaffGrp holds basic layout info -->
    <xsl:variable name="outerStaffGrp">
      <staffGrp>
        <xsl:variable name="temptree">
          <!-- Create staffDef elements, copy part-group elements  -->
          <xsl:apply-templates select="score-part|part-group" mode="layout"/>
        </xsl:variable>
        <xsl:variable name="temptree2">
          <!-- Number staves -->
          <xsl:apply-templates select="$temptree" mode="numberStaves"/>
        </xsl:variable>
        <!-- Emit staffGrp and staffDef elements already created -->
        <xsl:copy-of select="$temptree2/staffGrp|$temptree2/staffDef"/>
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
      <staffGrp>
        <xsl:for-each select="$in/staffGrp">
          <xsl:for-each select="staffDef | staffGrp">
            <xsl:choose>
              <xsl:when test="local-name()='staffDef'">
                <xsl:variable name="thisStaff">
                  <xsl:value-of select="number(@n)"/>
                </xsl:variable>
                <xsl:choose>
                  <xsl:when
                    test="following::grpSym[number(@level)=$pass and number(@start)=$thisStaff]">
                    <xsl:variable name="start">
                      <xsl:value-of
                        select="following::grpSym[number(@level)=$pass and number(@start)=$thisStaff]/@start"
                      />
                    </xsl:variable>
                    <xsl:variable name="end">
                      <xsl:value-of
                        select="following::grpSym[number(@level)=$pass and number(@start)=$thisStaff]/@end"
                      />
                    </xsl:variable>
                    <staffGrp>
                      <xsl:copy-of
                        select="following::grpSym[number(@level)=$pass and number(@start)=$thisStaff]/@symbol"/>
                      <xsl:copy-of
                        select="following::grpSym[number(@level)=$pass and number(@start)=$thisStaff]/@barthru"/>
                      <xsl:copy-of
                        select="following::grpSym[number(@level)=$pass and number(@start)=$thisStaff]/@label"/>
                      <xsl:copy-of
                        select="following::grpSym[number(@level)=$pass and number(@start)=$thisStaff]/@label.abbr"/>
                      <xsl:copy-of select="."/>
                      <xsl:copy-of
                        select="following-sibling::staffDef[number(@n) &lt;= $end] | following-sibling::staffGrp[staffDef[number(@n) &lt;= $end]]"
                      />
                    </staffGrp>
                  </xsl:when>
                  <xsl:when
                    test="following::grpSym[number(@level)=$pass and number(@start) &lt;= $thisStaff and number(@end) &gt;=$thisStaff]">
                    <!-- This node is in the range defined by a grpSym for this pass and has already been copied -->
                  </xsl:when>
                  <xsl:otherwise>
                    <xsl:copy-of select="."/>
                  </xsl:otherwise>
                </xsl:choose>
              </xsl:when>
              <xsl:when test="local-name()='staffGrp'">
                <xsl:variable name="thisStaff">
                  <xsl:value-of select="number(staffDef[1]/@n)"/>
                </xsl:variable>
                <xsl:choose>
                  <xsl:when
                    test="following::grpSym[number(@level)=$pass and number(@start)=$thisStaff]">
                    <xsl:variable name="start">
                      <xsl:value-of
                        select="following::grpSym[number(@level)=$pass and number(@start)=$thisStaff]/@start"
                      />
                    </xsl:variable>
                    <xsl:variable name="end">
                      <xsl:value-of
                        select="following::grpSym[number(@level)=$pass and number(@start)=$thisStaff]/@end"
                      />
                    </xsl:variable>
                    <staffGrp>
                      <xsl:copy-of
                        select="following::grpSym[number(@level)=$pass and number(@start)=$thisStaff]/@symbol"/>
                      <xsl:copy-of
                        select="following::grpSym[number(@level)=$pass and number(@start)=$thisStaff]/@barthru"/>
                      <xsl:copy-of
                        select="following::grpSym[number(@level)=$pass and number(@start)=$thisStaff]/@label"/>
                      <xsl:copy-of
                        select="following::grpSym[number(@level)=$pass and number(@start)=$thisStaff]/@label.abbr"/>
                      <xsl:copy-of select="."/>
                      <xsl:copy-of
                        select="following-sibling::staffDef[number(@n) &lt;= $end] | following-sibling::staffGrp[staffDef[number(@n) &lt;= $end]]"
                      />
                    </staffGrp>
                  </xsl:when>
                  <xsl:when
                    test="following::grpSym[number(@level)=$pass and number(@start) &lt;= $thisStaff and number(@end) &gt;=$thisStaff]">
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
        <xsl:for-each select="$in/staffGrp/grpSym[@level != $pass]">
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
        <!-- Emit the new outer staffGrp element -->
        <!-- Remove redundant outer staffGrp element -->
        <xsl:choose>
          <xsl:when test="count($newOuterStaffGrp/staffGrp/*) = 1">
            <xsl:copy-of select="$newOuterStaffGrp/staffGrp/staffGrp"/>
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
        <staffDef>
          <xsl:attribute name="xml:id">
            <xsl:value-of select="$partID"/>
          </xsl:attribute>
          <!-- staff label -->
          <xsl:attribute name="label">
            <xsl:value-of select="part-name"/>
          </xsl:attribute>
          <!-- abbreviated staff label -->
          <xsl:if test="part-abbreviation != ''">
            <xsl:attribute name="label.abbr">
              <xsl:value-of select="part-abbreviation"/>
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
                <instrDef>
                  <xsl:variable name="midiID">
                    <xsl:value-of select="@id"/>
                  </xsl:variable>
                  <!--<xsl:attribute name="n">
                    <!-\- Clean up instrDef name by replacing space w/ underscore 
                    and parentheses with null -\->
                    <xsl:value-of
                      select="replace(replace(normalize-space(preceding-sibling::score-instrument[@id=$midiID]),
                      ' ', '_'),'[\(\)]', '')"
                    />
                  </xsl:attribute>-->
                  <xsl:attribute name="xml:id">
                    <xsl:value-of select="$midiID"/>
                  </xsl:attribute>
                  <xsl:attribute name="midi.channel">
                    <xsl:value-of select="midi-channel"/>
                  </xsl:attribute>
                  <!-- It appears that MusicXML is using 1-based program numbers. Convert to 0-based. -->
                  <xsl:attribute name="midi.instrnum">
                    <xsl:value-of select="number(midi-program) - 1"/>
                  </xsl:attribute>
                </instrDef>
              </xsl:for-each>
            </xsl:when>
            <xsl:when test="score-instrument">
              <xsl:for-each select="score-instrument">
                <instrDef>
                  <xsl:attribute name="xml:id">
                    <xsl:value-of select="@id"/>
                  </xsl:attribute>
                  <xsl:attribute name="midi.channel">
                    <xsl:value-of select="count(preceding::score-instrument)+1"/>
                  </xsl:attribute>
                  <xsl:attribute name="midi.instrnum">1</xsl:attribute>
                </instrDef>
              </xsl:for-each>
            </xsl:when>
          </xsl:choose>
        </staffDef>
      </xsl:when>
      <xsl:otherwise>
        <!-- When there's more than one staff in the part, create a staffGrp, a midi instrument
             definition(s) for the group, then the required number of MEI staffDef elements. -->
        <staffGrp>
          <xsl:attribute name="xml:id">
            <xsl:value-of select="$partID"/>
          </xsl:attribute>
          <!-- Single part with multiple staves always uses a bracket -->
          <xsl:attribute name="symbol">brace</xsl:attribute>
          <!-- group label -->
          <xsl:attribute name="label">
            <xsl:value-of select="part-name"/>
          </xsl:attribute>
          <!-- abbreviated group label -->
          <xsl:if test="part-abbreviation  !=  ''">
            <xsl:attribute name="label.abbr">
              <xsl:value-of select="part-abbreviation"/>
            </xsl:attribute>
          </xsl:if>
          <!-- instrument definition -->
          <xsl:for-each select="midi-instrument">
            <instrDef>
              <xsl:variable name="midiID">
                <xsl:value-of select="@id"/>
              </xsl:variable>
              <!--<xsl:attribute name="n">
                <!-\- Clean up instrDef name by replacing space w/ underscore 
                    and parentheses with null -\->
                <xsl:value-of
                  select="replace(replace(normalize-space(preceding-sibling::score-instrument[@id=$midiID]),
                  ' ', '_'),'[\(\)]', '')"
                />
              </xsl:attribute>-->
              <xsl:attribute name="xml:id">
                <xsl:value-of select="$midiID"/>
              </xsl:attribute>
              <xsl:attribute name="midi.channel">
                <xsl:value-of select="midi-channel"/>
              </xsl:attribute>
              <!-- It appears that MusicXML is using 1-based program numbers. Convert to 0-based. -->
              <xsl:attribute name="midi.instrnum">
                <xsl:value-of select="number(midi-program) - 1"/>
              </xsl:attribute>
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

  <xsl:template match="staffDef|staffGrp|part-group" mode="numberStaves">
    <!-- Number staves -->
    <xsl:choose>
      <xsl:when test="name()='staffDef'">
        <staffDef>
          <xsl:attribute name="n">
            <xsl:value-of select="count(preceding::staffDef) + 1"/>
          </xsl:attribute>
          <xsl:copy-of select="@*|node()"/>
        </staffDef>
      </xsl:when>
      <xsl:when test="name()='staffGrp'">
        <staffGrp>
          <xsl:copy-of select="@*|instrDef"/>
          <xsl:for-each select="staffDef">
            <staffDef>
              <xsl:attribute name="n">
                <xsl:value-of select="count(preceding::staffDef) + 1"/>
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
        <xsl:value-of select="following-sibling::staffDef[1]/@n"/>
      </xsl:attribute>
      <xsl:variable name="level">
        <xsl:value-of select="@number"/>
      </xsl:variable>
      <xsl:attribute name="end">
        <xsl:for-each select="following-sibling::part-group[@type='stop' and @number=$level][1]">
          <xsl:value-of select="preceding-sibling::staffDef[1]/@n"/>
        </xsl:for-each>
      </xsl:attribute>
      <xsl:if test="group-name">
        <xsl:attribute name="label">
          <xsl:value-of select="group-name"/>
        </xsl:attribute>
      </xsl:if>
      <xsl:if test="group-abbreviation">
        <xsl:attribute name="label.abbr">
          <xsl:value-of select="group-abbreviation"/>
        </xsl:attribute>
      </xsl:if>
      <xsl:if test="group-barline='yes'">
        <xsl:attribute name="barthru">true</xsl:attribute>
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
      <staffDef>
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
    <xsl:for-each select="following::measure[1]/part[@id=$partID]/attributes">
      <!-- number of staff lines -->
      <xsl:attribute name="lines">
        <xsl:choose>
          <xsl:when test="staff-details/staff-lines">
            <xsl:value-of select="staff-details/staff-lines"/>
          </xsl:when>
          <xsl:otherwise>5</xsl:otherwise>
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
            <xsl:attribute name="tab.strings">
              <xsl:variable name="tabstrings">
                <xsl:for-each select="following-sibling::staff-details">
                  <xsl:for-each select="staff-tuning">
                    <xsl:sort select="@line" order="descending"/>
                    <xsl:variable name="thisstring">
                      <xsl:value-of select="tuning-step"/>
                    </xsl:variable>
                    <xsl:value-of select="translate(tuning-step,'ABCDEFG','abcdefg')"/>
                    <xsl:for-each
                      select="following-sibling::staff-tuning/tuning-step[.=$thisstring]">
                      <xsl:text>'</xsl:text>
                    </xsl:for-each>
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
      <!-- key -->
      <xsl:if test="key">
        <xsl:variable name="keysig">
          <xsl:value-of select="key/fifths"/>
        </xsl:variable>
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
            <xsl:attribute name="key.sig"><xsl:value-of select="abs($keysig)"/>f</xsl:attribute>
          </xsl:when>
        </xsl:choose>
      </xsl:if>
      <!-- key mode -->
      <xsl:if test="key/mode">
        <xsl:attribute name="key.mode">
          <xsl:value-of select="key/mode"/>
        </xsl:attribute>
      </xsl:if>
      <!-- staff transposition -->
      <xsl:if test="transpose">
        <xsl:attribute name="trans.semi">
          <xsl:choose>
            <xsl:when test="transpose/octave-change">
              <xsl:variable name="octavechange">
                <xsl:value-of select="transpose/octave-change"/>
              </xsl:variable>
              <xsl:variable name="chromatic">
                <xsl:value-of select="transpose/chromatic"/>
              </xsl:variable>
              <xsl:value-of select="$chromatic + (12 * $octavechange)"/>
            </xsl:when>
            <xsl:otherwise>
              <xsl:value-of select="transpose/chromatic"/>
            </xsl:otherwise>
          </xsl:choose>
        </xsl:attribute>
        <xsl:if test="transpose/diatonic">
          <xsl:attribute name="trans.diat">
            <xsl:value-of select="transpose/diatonic"/>
          </xsl:attribute>
        </xsl:if>
      </xsl:if>
      <xsl:for-each select="divisions">
        <xsl:attribute name="ppq">
          <xsl:value-of select="."/>
        </xsl:attribute>
      </xsl:for-each>
    </xsl:for-each>
  </xsl:template>

</xsl:stylesheet>
