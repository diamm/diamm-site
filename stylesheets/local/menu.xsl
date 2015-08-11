<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet exclude-result-prefixes="#all" version="2.0" xmlns="http://www.w3.org/1999/xhtml"
  xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:xmg="http://www.cch.kcl.ac.uk/xmod/global/1.0"
  xmlns:xmm="http://www.cch.kcl.ac.uk/xmod/menu/1.0" xmlns:xmp="http://www.cch.kcl.ac.uk/xmod/properties/1.0"
  xmlns:xms="http://www.cch.kcl.ac.uk/xmod/spec/1.0" xmlns:xmv="http://www.cch.kcl.ac.uk/xmod/views/1.0"
  xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:import href="../xmod/menu/menu.xsl" />

  <xsl:param name="filedir" />
  <xsl:param name="filename" />
  <xsl:param name="fileextension" />

  <xsl:variable name="xmg:pathroot" select="concat('/', $filedir)" />
  <xsl:variable name="xmg:path" select="concat($xmg:pathroot, '/', $filename)" />
  <xsl:variable name="xmg:menu-top" select="true()" />

  <xsl:template match="/">
    <xsl:if test="$xmg:menu-top = true()">
      <xsl:call-template name="xmm:menu-top" />
    </xsl:if>
  </xsl:template>
</xsl:stylesheet>
