<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet exclude-result-prefixes="#all" version="2.0" xmlns="http://www.w3.org/1999/xhtml"
  xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl"
  xmlns:xmg="http://www.cch.kcl.ac.uk/xmod/global/1.0" xmlns:xmp="http://www.cch.kcl.ac.uk/xmod/properties/1.0"
  xmlns:xms="http://www.cch.kcl.ac.uk/xmod/spec/1.0" xmlns:xmv="http://www.cch.kcl.ac.uk/xmod/views/1.0"
  xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:import href="default.xsl" />

  <xd:doc scope="stylesheet">
    <xd:desc>
      <xd:p><xd:b>Created on:</xd:b> Mar 18, 2011</xd:p>
      <xd:p><xd:b>Author:</xd:b> jvieira</xd:p>
      <xd:p>Stylesheet to display the news items. Creates and id for each news item so they can be linked from the
        rss.</xd:p>
    </xd:desc>
  </xd:doc>

  <xsl:variable name="item-count" select="count(/aggregation/tei:TEI/tei:text/tei:body/tei:div)" />

  <xsl:template name="xms:content">
    <p class="content" style="text-align: right;">
      <a class="content" href="news.xml" title="Download or view newsfeed XML" type="application/rss+xml">
        <xsl:text>RSS newsfeed (rss.xml)</xsl:text>
      </a>
    </p>

    <xsl:apply-templates select="/aggregation/tei:TEI" />
  </xsl:template>

  <xsl:template match="/aggregation/tei:TEI/tei:text/tei:body/tei:div">
    <div id="item-{$item-count - count(preceding-sibling::tei:div)}">
      <xsl:apply-templates />
    </div>
  </xsl:template>
</xsl:stylesheet>
