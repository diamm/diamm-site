<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet exclude-result-prefixes="#all" version="2.0" xmlns="http://www.w3.org/1999/xhtml"
  xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl"
  xmlns:xmg="http://www.cch.kcl.ac.uk/xmod/global/1.0" xmlns:xmp="http://www.cch.kcl.ac.uk/xmod/properties/1.0"
  xmlns:xms="http://www.cch.kcl.ac.uk/xmod/spec/1.0" xmlns:xmv="http://www.cch.kcl.ac.uk/xmod/views/1.0"
  xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:import href="default.xsl" />

  <xd:doc scope="stylesheet">
    <xd:desc>
      <xd:p><xd:b>Created on:</xd:b> Mar 17, 2011</xd:p>
      <xd:p><xd:b>Author:</xd:b> jvieira</xd:p>
      <xd:p />
    </xd:desc>
  </xd:doc>

  <xsl:variable name="xmg:title" select="'Submit New Information'" />

  <xsl:template name="xmv:script">
    <script src="http://www.google.com/recaptcha/api/js/recaptcha_ajax.js" type="text/javascript">&#160;</script>
    <script src="{$xmp:assets-path}/s/jquery-1.4.2.min.js" type="text/javascript">&#160;</script>
    <script src="{$xmp:assets-path}/s/recaptcha.js" type="text/javascript">&#160;</script>
    <script src="{$xmp:assets-path}/s/c.js" type="text/javascript">&#160;</script>
  </xsl:template>

  <xsl:template name="xms:content">
    <xsl:if test="/aggregation/success">
      <p><xsl:value-of select="/aggregation/success" /></p>
    </xsl:if>
    
    <xsl:apply-templates mode="copy-form" select="/aggregation/html-form/*" />
  </xsl:template>

  <xsl:template match="*" mode="copy-form">
    <xsl:element name="{local-name()}">
      <xsl:sequence select="@*" />
      <xsl:apply-templates mode="copy-form" />
    </xsl:element>
  </xsl:template>
</xsl:stylesheet>
