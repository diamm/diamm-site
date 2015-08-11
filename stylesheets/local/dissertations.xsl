<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet exclude-result-prefixes="#all" version="2.0" xmlns="http://www.w3.org/1999/xhtml"
  xmlns:math="java.lang.Math" xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl"
  xmlns:xmg="http://www.cch.kcl.ac.uk/xmod/global/1.0" xmlns:xmm="http://www.cch.kcl.ac.uk/xmod/menu/1.0"
  xmlns:xmp="http://www.cch.kcl.ac.uk/xmod/properties/1.0" xmlns:xms="http://www.cch.kcl.ac.uk/xmod/spec/1.0"
  xmlns:xmv="http://www.cch.kcl.ac.uk/xmod/views/1.0" xmlns:xs="http://www.w3.org/2001/XMLSchema"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:import href="default.xsl" />

  <xd:doc scope="stylesheet">
    <xd:desc>
      <xd:p><xd:b>Created on:</xd:b> May 16, 2011</xd:p>
      <xd:p><xd:b>Author:</xd:b> jvieira</xd:p>
      <xd:p>Stylesheet to display doctoral dissertations with A-Z navigation.</xd:p>
    </xd:desc>
  </xd:doc>

  <xsl:template match="/">
    <xsl:apply-imports />
  </xsl:template>

  <xsl:template name="xms:content">
    <xsl:variable name="tei">
      <xsl:sequence select="/aggregation/tei:TEI" />
    </xsl:variable>
        <ul class="nvz" id="alpha-nav">
          <xsl:for-each select="65 to 90">
            <xsl:variable name="link" select="codepoints-to-string(.)" />

            <li>
              <xsl:choose>
                <xsl:when test="$tei/tei:TEI/tei:text/tei:body/tei:div[tei:head/tei:ref/@n = $link]">
                  <a href="#{$link}">
                    <xsl:value-of select="$link" />
                  </a>
                </xsl:when>
                <xsl:otherwise>
                  <xsl:value-of select="$link" />
                </xsl:otherwise>
              </xsl:choose>
            </li>
          </xsl:for-each>
        </ul>
    

    <xsl:for-each-group group-by="upper-case(tei:head/tei:ref/@n)"
      select="/aggregation/tei:TEI/tei:text/tei:body/tei:div">
      <xsl:sort select="current-grouping-key()" />

      <div id="{current-grouping-key()}">
        <h3>
          <xsl:value-of select="current-grouping-key()" />
        </h3>
        <xsl:for-each select="current-group()">
          <xsl:apply-templates />
        </xsl:for-each>
        <a href="#alpha-nav">
          <span>Back to top</span>
        </a>
      </div>
    </xsl:for-each-group>
  </xsl:template>
</xsl:stylesheet>
