<?xml version="1.0" encoding="UTF-8"?>

<!-- 
    name: rng2odd.xsl
    
    author: Raffaele Viglianti
    
    description: This script converts ../RelaxSchema/mei19b-all.rng into a valid TEI ODD file
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"
    xmlns:rng="http://relaxng.org/ns/structure/1.0" xmlns="http://www.tei-c.org/ns/1.0"
    xmlns:a="http://relaxng.org/ns/compatibility/annotations/1.0"
    xmlns:xhtml="http://www.w3.org/1000/xhtml"
    xml:lang="en" xpath-default-namespace="http://relaxng.org/ns/structure/1.0">

    <xsl:output encoding="UTF-8" indent="yes" method="xml"/>
    
    <!-- Variables -->
    
    <!-- name: datatypes
         decription: relative path to datatypes.rng, included in MEI rng
    -->
    <xsl:variable name="datatypes">../RelaxSchema/datatypes.rng</xsl:variable>
    
    <!-- Functions -->
    
    <!-- name: make-namespace-node.
         description: copy an element adding namespace "rng".
         recursive: copy children elements recursively.-->
    <xsl:template name="make-namespace-node">
        <xsl:param name="recursive"/>
            <xsl:if test="not(contains(@name, '_DUMMY'))">
            <xsl:element name="rng:{local-name(.)}">
                <xsl:sequence select="@*"/>
                <!-- recursive-->
                <xsl:choose>
                    <!-- ON -->
                    <xsl:when test="$recursive and *[not(self::text())]">
                        <xsl:for-each select="*[not(self::text())]">
                            <xsl:call-template name="make-namespace-node">
                                <xsl:with-param name="recursive" select="true()"/>
                            </xsl:call-template>
                        </xsl:for-each>
                    </xsl:when>
                    <!-- OFF -->
                    <xsl:otherwise>
                        <xsl:value-of select="."/>
                    </xsl:otherwise>
                    </xsl:choose>
            </xsl:element>
            </xsl:if>
    </xsl:template>


    <!-- MAIN -->
    <xsl:template match="/">

        <xsl:processing-instruction name="oxygen">
            <xsl:text>RNGSchema="http://www.tei-c.org/release/xml/tei/custom/schema/relaxng/tei_all.rng" type="xml"</xsl:text>
        </xsl:processing-instruction>

        <TEI>

            <teiHeader>
                <fileDesc>
                    <titleStmt>
                        <title>MEI</title>
                    </titleStmt>
                    <publicationStmt>
                        <p>Converted from rng through an XSLT script written by Raffaele Viglianti</p>
                    </publicationStmt>
                    <sourceDesc>
                        <p>created on <xsl:value-of select="current-dateTime()"/></p>
                    </sourceDesc>
                </fileDesc>
            </teiHeader>
            <text>
                <front>
                    <divGen type="toc"/>
                </front>
                <body>
                    <p>MEI</p>

                    <schemaSpec ident="mei" start="mei" ns="http://www.edirom.de/ns/mei">

                        <!-- DATA -->
                        <xsl:comment>
                            <xsl:text>
                                ****
                                Definition of Macros. Datatypes and Attribute Value Lists
                                Number of definitions found in original RNG: </xsl:text>
                            <xsl:value-of select="count(document($datatypes)//define[starts-with(@name, 'data.')])"/>
                            <xsl:text>
                                ****
                            </xsl:text>
                        </xsl:comment>
                        <xsl:apply-templates select="document($datatypes)//define[starts-with(@name, 'data.')]"/>

                        <!-- ATTRIBUTES -->
                        <xsl:comment>
                            <xsl:text>
                                ****
                                Defintion of Attribute Classes
                                Number of definitions found in original RNG: </xsl:text>
                            <xsl:value-of select="count(//define[starts-with(@name, 'att.')])"/>
                            <xsl:text>
                                ****
                            </xsl:text>
                        </xsl:comment>
                        <xsl:apply-templates select="//define[starts-with(@name, 'att.')]"/>
                        
                        <!--MODELS-->
                        <!-- N.B. models in RNG don't seem to work in the same way as ODD.
                            What element should be used in ODD for reusable content? -->
                        <xsl:comment>
                            <xsl:text>
                                ****
                                Defintion of Element Model Classes
                                Number of definitions found in original RNG: </xsl:text>
                            <xsl:value-of select="count(//define[starts-with(@name, 'model.')])"/>
                            <xsl:text>
                                ****
                            </xsl:text>
                        </xsl:comment>
                        <xsl:apply-templates select="//define[starts-with(@name, 'model.')]"/>
                        
                        <!-- ELEMENTS -->
                        <!-- N.B. If the modularization of element, attlist.element and content.element
                            was done to facilitate the change of the element's name (i.e. for translations)
                            remember that it is possible to specify alternative names in ODD in <elementSpec>.
                            For this reason, this scripts re-joins them together -->
                        <xsl:comment>
                            <xsl:text>
                                ****
                                Defintion of Elements
                                Number of definitions found in original RNG: </xsl:text>
                            <xsl:value-of select="count(//define[not(contains(@name, '.'))])"/>
                            <xsl:text>
                                ****
                            </xsl:text>
                        </xsl:comment>
                        <xsl:apply-templates select="//define[not(contains(@name, '.'))]"/>
                    </schemaSpec>

                </body>
            </text>
        </TEI>
    </xsl:template>

    <!-- Data Template-->
    <xsl:template match="//define[starts-with(@name, 'data.')]">
        <!-- 
            Attributes found in RNG: @name
            Content found in RNG: data|ref|choice 
        -->
        <macroSpec type="dt" ident="{@name}">
            <desc>
                <xsl:value-of select="preceding-sibling::comment()[1]"/>
            </desc>
            <content>
                <xsl:for-each select="*">
                    <xsl:call-template name="make-namespace-node">
                        <xsl:with-param name="recursive" select="true()"/>
                    </xsl:call-template>
                </xsl:for-each>
            </content>
        </macroSpec>
    </xsl:template>

    <!-- Attributes Template -->
    <xsl:template match="//define[starts-with(@name, 'att.')]">
        <!-- 
            Attributes found in RNG: @name
            Content found in RNG: data|ref|choice|value 
        -->
        <classSpec type="atts" ident="{@name}">
            <desc>
                <xsl:value-of select="preceding-sibling::xhtml:div[1]//xhtml:div[@class='desc']/xhtml:p"/>
            </desc>
            <!-- 
                N.B. ignoring child::empty -> does it make sense to have an empty attribute?
            -->
            <xsl:if test="ref">
                <classes>
                <xsl:for-each select="ref">
                    <memberOf key="{@name}"/>
                </xsl:for-each>
                </classes>
            </xsl:if>
            <xsl:if test="descendant::attribute">
                <attList>
                <xsl:for-each select="descendant::attribute">
                    
                    <attDef ident="{@name}">
                        <xsl:choose>
                            <xsl:when test="parent::optional">
                                <xsl:attribute name="usage">opt</xsl:attribute>
                            </xsl:when>
                            <xsl:when test="parent::define">
                                <xsl:attribute name="usage">req</xsl:attribute>
                            </xsl:when>
                        </xsl:choose>
                        <xsl:choose>
                            <xsl:when test="data | ref">
                                <datatype>
                                    <!-- N.B. attributes like @maxoccurs are available here, are they used for lists in PR's rng? -->
                                    <xsl:for-each select="data | ref">
                                        <xsl:call-template name="make-namespace-node">
                                            <xsl:with-param name="recursive"/>
                                        </xsl:call-template>
                                    </xsl:for-each>
                                </datatype>
                            </xsl:when>
                           
                            <!-- N.B. even closed lists can have a <datatype> specified in ODD -->
                            <xsl:when test="value">
                                <defaultVal><xsl:value-of select="value"/></defaultVal>
                                <valList type="closed">
                                    <valItem ident="{value}"/>
                                </valList>
                            </xsl:when>
                            <xsl:when test="choice">
                                <xsl:if test="@a:defaultValue">
                                    <defaultVal><xsl:value-of select="@a:defaultValue"/></defaultVal>
                                </xsl:if>
                                <valList>
                                    <xsl:attribute name="type">
                                        <xsl:choose>
                                            <xsl:when test="choice[not(text)]"><xsl:text>closed</xsl:text></xsl:when>
                                            <!-- not present in attribute definitions... -->
                                            <xsl:when test="choice[text]"><xsl:text>semi</xsl:text></xsl:when>
                                        </xsl:choose>
                                    </xsl:attribute>
                                    <xsl:for-each select="choice/text">
                                        <xsl:call-template name="make-namespace-node"/> 
                                    </xsl:for-each>
                                    <xsl:for-each select="choice/value">
                                        <valItem ident="{.}"/>
                                    </xsl:for-each>
                                </valList>
                            </xsl:when>
                        </xsl:choose>
                    </attDef>
                </xsl:for-each>
                </attList>
            </xsl:if>
        </classSpec>
    </xsl:template>
    
    <!-- MODELS -->
    <xsl:template match="//define[starts-with(@name, 'model.')]">
        <!-- 
            Attributes found in RNG: @name
            Content found in RNG: ref|choice|optional|zeroOrMore
        -->
        <macroSpec type="pe" ident="{@name}">
            <desc>
                <xsl:value-of select="preceding-sibling::xhtml:div[1]//xhtml:div[@class='desc']/xhtml:p"/>
            </desc>
            <content>
                <xsl:for-each select="*">
                    <xsl:call-template name="make-namespace-node">
                        <xsl:with-param name="recursive" select="true()"/>
                    </xsl:call-template>
                </xsl:for-each>
            </content>
            <!--<content>
                <xsl:choose>
                    <xsl:when test="data | ref">
                        <datatype>
                             N.B. attributes like @maxoccurs are available here, are they used for lists in PR's rng? 
                            <xsl:for-each select="data | ref">
                                <xsl:call-template name="make-namespace-node">
                                    <xsl:with-param name="recursive"/>
                                </xsl:call-template>
                            </xsl:for-each>
                        </datatype>
                    </xsl:when>
                    
                     N.B. even closed lists can have a <datatype> specified in ODD 
                    <xsl:when test="value">
                        <defaultVal><xsl:value-of select="value"/></defaultVal>
                        <valList type="closed">
                            <valItem ident="{value}"/>
                        </valList>
                    </xsl:when>
                    <xsl:when test="choice">
                        <xsl:if test="@a:defaultValue">
                            <defaultVal><xsl:value-of select="@a:defaultValue"/></defaultVal>
                        </xsl:if>
                        <valList>
                            <xsl:attribute name="type">
                                <xsl:choose>
                                    <xsl:when test="choice[not(text)]"><xsl:text>closed</xsl:text></xsl:when>
                                     not present in attribute definitions... 
                                    <xsl:when test="choice[text]"><xsl:text>semi</xsl:text></xsl:when>
                                </xsl:choose>
                            </xsl:attribute>
                            <xsl:for-each select="choice/text">
                                <xsl:call-template name="make-namespace-node"/> 
                            </xsl:for-each>
                            <xsl:for-each select="choice/value">
                                <valItem ident="{.}"/>
                            </xsl:for-each>
                        </valList>
                    </xsl:when>
                </xsl:choose>
                </content>-->
        </macroSpec>
    </xsl:template>
    
    <!-- ELEMENTS -->
    <xsl:template match="//define[not(contains(@name, '.'))]">
        <!-- 
            Attributes found in RNG: @name
            Content found in RNG: zeroOrMore|oneOrMoreref|empty|ref|optional|choice|text 
        -->
        <xsl:variable name="element-name" select="@name"/>
        <elementSpec ident="{@name}">
            <desc>
                <xsl:value-of select="preceding-sibling::xhtml:div[1]//xhtml:div[@class='desc']/xhtml:p"/>
            </desc>
            <!-- 
                N.B. ignoring child::empty -> does it make sense to have an empty attribute?
            -->
            <xsl:if test="ancestor::grammar//define[@name=concat('attlist.',$element-name)]/ref">
                <classes>
                    <xsl:for-each select="ancestor::grammar//define[@name=concat('attlist.',$element-name)]/ref">
                        <memberOf key="{@name}"/>
                    </xsl:for-each>
                </classes>
            </xsl:if>
            <xsl:if test="ancestor::grammar//define[@name=concat('attlist.',$element-name)]/descendant::attribute">
            <attList>
                <!-- Pulled from attlist.{@name} -->
                <!-- Check combine interleave - meaning? -->
                <xsl:for-each select="ancestor::grammar//define[@name=concat('attlist.',$element-name)]">
                    
                        <xsl:for-each select="descendant::attribute">
                        
                        <attDef ident="{@name}">
                            <xsl:choose>
                                <xsl:when test="parent::optional">
                                    <xsl:attribute name="usage">opt</xsl:attribute>
                                </xsl:when>
                                <xsl:when test="parent::define">req</xsl:when>
                            </xsl:choose>
                            <xsl:choose>
                                <xsl:when test="data | ref">
                                    <datatype>
                                        <!-- N.B. attributes like @maxoccurs are available here, are they used for lists in PR's rng? -->
                                        <xsl:for-each select="data | ref">
                                            <xsl:call-template name="make-namespace-node">
                                                <xsl:with-param name="recursive"/>
                                            </xsl:call-template>
                                        </xsl:for-each>
                                    </datatype>
                                </xsl:when>
                                
                                <!-- N.B. even closed lists can have a <datatype> specified in ODD -->
                                <xsl:when test="value">
                                    <defaultVal><xsl:value-of select="value"/></defaultVal>
                                    <valList type="closed">
                                        <valItem ident="{value}"/>
                                    </valList>
                                </xsl:when>
                                <xsl:when test="choice">
                                    <xsl:if test="@a:defaultValue">
                                        <defaultVal><xsl:value-of select="@a:defaultValue"/></defaultVal>
                                    </xsl:if>
                                    <valList>
                                        <xsl:attribute name="type">
                                            <xsl:choose>
                                                <xsl:when test="choice[not(text)]"><xsl:text>closed</xsl:text></xsl:when>
                                                <!-- not present in attribute definitions... -->
                                                <xsl:when test="choice[text]"><xsl:text>semi</xsl:text></xsl:when>
                                            </xsl:choose>
                                        </xsl:attribute>
                                        <xsl:for-each select="choice/text">
                                            <xsl:call-template name="make-namespace-node"/> 
                                        </xsl:for-each>
                                        <xsl:for-each select="choice/value">
                                            <valItem ident="{.}"/>
                                        </xsl:for-each>
                                    </valList>
                                </xsl:when>
                            </xsl:choose>
                        </attDef>
                        </xsl:for-each>
                </xsl:for-each>
            </attList>
            </xsl:if>
            
            <content>
                <!-- Pulled from content.{@name} -->
                <xsl:for-each select="ancestor::grammar//define[@name=concat('content.',$element-name)]/*">
                    <xsl:call-template name="make-namespace-node">
                        <xsl:with-param name="recursive" select="true()"/>
                    </xsl:call-template>
                </xsl:for-each>
                <xsl:for-each select="element/*[not(self::ref[starts-with(@name, 'attlist.') or starts-with(@name, 'content.')])]">
                    <xsl:call-template name="make-namespace-node">
                        <xsl:with-param name="recursive" select="true()"/>
                    </xsl:call-template>
                </xsl:for-each>
            </content>
        </elementSpec>
    </xsl:template>

</xsl:stylesheet>
