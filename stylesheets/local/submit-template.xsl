<?xml version="1.0" encoding="UTF-8"?>
<!--
  Copyright 1999-2004 The Apache Software Foundation
  
  Licensed under the Apache License, Version 2.0 (the "License");
  you may not use this file except in compliance with the License.
  You may obtain a copy of the License at
  
  http://www.apache.org/licenses/LICENSE-2.0
  
  Unless required by applicable law or agreed to in writing, software
  distributed under the License is distributed on an "AS IS" BASIS,
  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
  See the License for the specific language governing permissions and
  limitations under the License.
-->
<xsl:stylesheet exclude-result-prefixes="#all" version="2.0" xmlns:bu="http://apache.org/cocoon/browser-update/1.0"
  xmlns:fi="http://apache.org/cocoon/forms/1.0#instance" xmlns:ft="http://apache.org/cocoon/forms/1.0#template"
  xmlns:jx="http://apache.org/cocoon/templates/jx/1.0" xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl"
  xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xd:doc scope="stylesheet">
    <xd:desc>
      <xd:p><xd:b>Created on:</xd:b> Apr 18, 2011</xd:p>
      <xd:p><xd:b>Author:</xd:b> jvieira</xd:p>
      <xd:p />
    </xd:desc>
  </xd:doc>

  <!--+ Include styling stylesheets, one for the widgets, the other one for the
      | page. As 'forms-advanced-field-styling.xsl' is a specialization of
      | 'forms-field-styling.xsl' the latter one is imported there. If you don't
      | want advanced styling of widgets, change it here!
      | See xsl:include as composition and xsl:import as extension/inheritance.
      +-->
  <xsl:import href="resource://org/apache/cocoon/forms/resources/forms-page-styling.xsl" />
  <xsl:import href="resource://org/apache/cocoon/forms/resources/forms-advanced-field-styling.xsl" />

  <!-- Location of the resources directory, where JS libs and icons are stored -->
  <xsl:param name="resources-uri">resources</xsl:param>

  <xsl:template match="html-head">
    <xsl:apply-templates mode="forms-page" select="." />
    <xsl:apply-templates mode="forms-field" select="." />
    <xsl:apply-templates />
  </xsl:template>

  <xsl:template match="html-form">
    <xsl:apply-templates />
  </xsl:template>
</xsl:stylesheet>
