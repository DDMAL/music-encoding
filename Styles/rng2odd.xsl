<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"
    xmlns:rng="http://relaxng.org/ns/structure/1.0" xmlns="http://www.tei-c.org/ns/1.0"
    xmlns:a="http://relaxng.org/ns/compatibility/annotations/1.0"
    xml:lang="en" xpath-default-namespace="http://relaxng.org/ns/structure/1.0">

    <xsl:output encoding="UTF-8" indent="yes" method="xml"/>

    <!-- Functions -->
    
    <!-- name: make-namespace-node.
         description: copy an element adding namespace "rng".
         recursive: copy children elements recursively.-->
    <xsl:template name="make-namespace-node">
        <xsl:param name="recursive"/>
        
            <xsl:element name="rng:{local-name(.)}">
                <xsl:sequence select="@*"/>
                <!-- recursive-->
                <xsl:choose>
                    <!-- ON -->
                    <xsl:when test="$recursive and (not(empty(.)) or text())">
                        <xsl:for-each select="*">
                            <xsl:call-template name="make-namespace-node"/>
                        </xsl:for-each>
                    </xsl:when>
                    <!-- OFF -->
                    <xsl:otherwise>
                        <xsl:value-of select="."/>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:element>
        
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
                        <author>Raffaele Viglianti</author>
                    </titleStmt>
                    <publicationStmt>
                        <p>Converted from rng through an XSLT script</p>
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
                            <xsl:value-of select="count(//define[starts-with(@name, 'data.')])"/>
                            <xsl:text>
                                ****
                            </xsl:text>
                        </xsl:comment>
                        <xsl:apply-templates select="//define[starts-with(@name, 'data.')]"/>

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
        <classSpec type="dt" ident="{@name}">
            <desc>
                <xsl:value-of select="preceding-sibling::comment()[1]"/>
            </desc>
            <attList>
                <xsl:for-each select="descendant::attribute">
                    
                    <attDef>
                        <xsl:attribute name="ident">
                            <xsl:value-of select="@name"/>
                        </xsl:attribute>
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
            </attList>
        </classSpec>
    </xsl:template>
    
    <!-- MODELS -->
    <xsl:template match="//define[starts-with(@name, 'model.')]">
        <!-- 
            Attributes found in RNG: @name
            Content found in RNG: data|ref|choice|value 
        -->
    </xsl:template>

</xsl:stylesheet>
