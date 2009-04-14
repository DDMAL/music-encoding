<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"
  xmlns:xhtml="http://www.w3.org/1000/xhtml" xmlns="http://relaxng.org/ns/structure/1.0">


  <!-- Stylesheet parameters -->

  <!-- Output parameters -->
  <xsl:output method="xml" indent="yes" encoding="UTF-8" omit-xml-declaration="no"
    standalone="no"/>
  <xsl:strip-space elements="*"/>

  <!-- Global variables -->
  <xsl:variable name="NL">
    <xsl:text>&#xA;&#xA;</xsl:text>
  </xsl:variable>

  <!-- Templates -->
  <xsl:template match="/">
    <xsl:apply-templates select="*:grammar"/>
  </xsl:template>

  <xsl:template match="*:grammar">
    <grammar xmlns:a="http://relaxng.org/ns/compatibility/annotations/1.0"
      xmlns="http://relaxng.org/ns/structure/1.0"
      datatypeLibrary="http://www.w3.org/2001/XMLSchema-datatypes"
      xmlns:xhtml="http://www.w3.org/1000/xhtml">
      <xsl:value-of select="$NL"/>
      <include href="datatypes.rng"/>
      <xsl:value-of select="$NL"/>
      <xsl:apply-templates select="*:define[starts-with(@name,'att.')]"/>
      <xsl:apply-templates select="*:define[starts-with(@name,'model.')]"/>
      <xsl:apply-templates select="*:define[*:element]"/>
      <xsl:apply-templates select="*:define[starts-with(@name,'_')]"/>
      <start>
        <choice>
          <ref name="mei"/>
          <ref name="meihead"/>
          <ref name="meicorpus"/>
          <ref name="music"/>
        </choice>
      </start>
      
    </grammar>
  </xsl:template>

  <xsl:template match="*:define[*:element]" exclude-result-prefixes="#default">
    <div>
      <xsl:attribute name="xml:id">
        <xsl:value-of select="@name"/>
      </xsl:attribute>
      <xhtml:div>
        <xhtml:h1 class="name">
          <xsl:value-of select="@name"/>
        </xhtml:h1>
        <xhtml:div class="desc">
          <xsl:apply-templates select="preceding-sibling::comment()[1]" mode="makeDesc"/>
        </xhtml:div>
      </xhtml:div>
      <xsl:copy-of select="." copy-namespaces="no" exclude-result-prefixes="#default"/>
      <xsl:variable name="myContent">
        <xsl:value-of select="concat('content.',@name)"/>
      </xsl:variable>
      <xsl:variable name="myAttlist">
        <xsl:value-of select="concat('attlist.',@name)"/>
      </xsl:variable>
      <xsl:apply-templates select="preceding-sibling::*:define[@name eq $myContent]"/>
      <xsl:apply-templates select="following-sibling::*:define[@name eq $myAttlist]"/>
    </div>
    <xsl:value-of select="$NL"/>
  </xsl:template>

  <xsl:template match="*:define" exclude-result-prefixes="#default">
    <div>
      <xsl:attribute name="xml:id">
        <xsl:value-of select="@name"/>
      </xsl:attribute>
      <xhtml:div>
        <xhtml:h1 class="name">
          <xsl:value-of select="@name"/>
        </xhtml:h1>
        <xhtml:div class="desc">
          <xsl:if test="not(starts-with(@name,'content.'))">
            <xsl:variable name="precedingComment">
              <xsl:value-of select="preceding-sibling::comment()[1]"/>
            </xsl:variable>
            <xsl:variable name="precedingNode">
              <xsl:value-of select="preceding-sibling::node()[1]"/>
            </xsl:variable>
            <xsl:if test="$precedingComment eq $precedingNode">
              <xsl:apply-templates select="preceding-sibling::comment()[1]"
                mode="makeDesc"/>
            </xsl:if>
          </xsl:if>
        </xhtml:div>
      </xhtml:div>
      <xsl:copy-of select="." copy-namespaces="no" exclude-result-prefixes="#default"/>
    </div>
    <xsl:if
      test="starts-with(@name,'att.') or starts-with(@name,'model.') or starts-with(@name,'_')">
      <xsl:value-of select="$NL"/>
    </xsl:if>
  </xsl:template>

  <xsl:template match="node()" exclude-result-prefixes="#default">
    <xsl:if test="not(following::*:grammar)">
      <xsl:copy copy-namespaces="no">
        <xsl:copy-of select="@*[not(name()='xmlns')]" copy-namespaces="no"
          exclude-result-prefixes="#default"/>
        <xsl:apply-templates/>
      </xsl:copy>
    </xsl:if>
  </xsl:template>

  <xsl:template match="@*" exclude-result-prefixes="#default">
    <xsl:if test="not(name()='xmlns')">
      <xsl:copy-of select="." copy-namespaces="no" exclude-result-prefixes="#default"/>
    </xsl:if>
  </xsl:template>

  <xsl:template match="comment()" mode="makeDesc">
    <xsl:if test="matches(normalize-space(.),'^doc:')">
      <xhtml:p>
        <xsl:value-of select="replace(normalize-space(.), '^doc: ','')"/>
      </xhtml:p>
    </xsl:if>
  </xsl:template>

</xsl:stylesheet>
