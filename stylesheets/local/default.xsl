<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet exclude-result-prefixes="#all" version="2.0" xmlns="http://www.w3.org/1999/xhtml"
  xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:xmg="http://www.cch.kcl.ac.uk/xmod/global/1.0"
  xmlns:xmm="http://www.cch.kcl.ac.uk/xmod/menu/1.0" xmlns:xmp="http://www.cch.kcl.ac.uk/xmod/properties/1.0"
  xmlns:xms="http://www.cch.kcl.ac.uk/xmod/spec/1.0" xmlns:xmv="http://www.cch.kcl.ac.uk/xmod/views/1.0"
  xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <!--
      Default stylesheet. Defines the templates that are called from
      the views stylesheets.
      
      It should be imported by other project specific stylesheets,
      where the variables/templates should be overriden as
      needed. Project-wide changes should be made here.
  -->

  <xsl:import href="../xmod/views/screen.xsl" />
  <xsl:import href="../xmod/tei/p5.xsl" />

  <xsl:param name="filedir" />
  <xsl:param name="filename" />
  <xsl:param name="fileextension" />
  <xsl:param name="menutop" select="'false'" />

  <xsl:variable name="xmg:title" select="//tei:TEI/tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:title[not(@type)]" />
  <xsl:variable name="xmg:pathroot" select="concat($xmp:context-path, '/', $filedir)" />
  <xsl:variable name="xmg:path"
    select="concat($xmg:pathroot, '/', substring-before($filename, '.'), '.', $fileextension)" />
  <xsl:variable name="xmg:menu-top" select="true()" />

  <xsl:template match="/">
    <xsl:call-template name="xmv:screen" />
  </xsl:template>

  <xsl:template name="xms:content">
    <xsl:apply-templates select="//tei:TEI" />
  </xsl:template>

  <xsl:template name="xmv:script">
    <script src="{$xmp:assets-path}/s/jquery-1.5.min.js" type="text/javascript">&#160;</script>
    <script src="{$xmp:assets-path}/s/c.js" type="text/javascript">&#160;</script>
    <script src="{$xmp:assets-path}/s/jquery.twitter.js" type="text/javascript">&#160;</script>
    <script src="http://use.typekit.com/tae2ufe.js" type="text/javascript">&#160;</script>
    <script type="text/javascript">try{Typekit.load();}catch(e){}</script>
  </xsl:template>

  <xsl:template name="xmv:body">
    <body id="t4">
      <div id="gw">
        <div id="hs">
          <!-- banner -->
          <xsl:call-template name="xmv:banner" />

          <!-- top navigation: menu-top.xsl -->
          <xsl:if test="$xmg:menu-top = true()">
            <xsl:call-template name="xmm:menu-top" />
          </xsl:if>

          <!-- breadcrumb navigation: menu.xsl -->
          <xsl:call-template name="xmm:breadcrumbs" />
        </div>

        <div id="cs">
          <div class="cg n2">
            <!-- content: local stylesheets -->
            <div class="m">
              <div class="c c1">
                <xsl:call-template name="xms:rhcontent" />

                <xsl:call-template name="xms:options1" />

                <xsl:call-template name="xms:submenu" />

                <xsl:call-template name="xms:pagehead" />

                <xsl:call-template name="xms:toc1" />

                <xsl:call-template name="xms:content" />

                <xsl:call-template name="xms:footnotes" />

                <xsl:call-template name="xms:toc2" />

                <xsl:call-template name="xms:options2" />
              </div>
            </div>

            <!-- left navigation: menu.xsl -->
            <div class="c c2">
              <xsl:text>&#160;</xsl:text>
              <xsl:choose>
                <xsl:when test="$xmg:menu-top = true()">
                  <xsl:call-template name="xmm:menu-top-sub" />
                </xsl:when>
                <xsl:otherwise>
                  <xsl:call-template name="xmm:menu" />
                </xsl:otherwise>
              </xsl:choose>
            </div>
          </div>
        </div>

        <xsl:call-template name="xmv:footer" />
      </div>
      <div id="overlay">
        <div class="overlayContent">&#160;</div>
      </div>
    </body>
  </xsl:template>

  <xsl:template name="xmv:banner">
    <div id="bs">
      <h3 title="{$xmp:title}">
        <a href="{$xmp:context-path}/" title="Return to the {$xmp:title} Homepage">Home</a>
      </h3>
      <h4 title="Digital Image Archive of Medieval Music">Digital Image Archive of Medieval Music</h4>
      <div class="gx">&#160;</div>
      <ul class="utl">
        <xsl:choose>
          <xsl:when test="/aggregation/user/name">
            <li>
              <label>
                <xsl:text>Hello, </xsl:text>
                <xsl:value-of select="/aggregation/user/name" />
              </label>
            </li>
            <li>
              <a href="{$xmp:context-path}/jsp/MyDiamm">MyDIAMM</a>
            </li>
            <li class="ix">
              <a class="t10 m5" href="{$xmp:context-path}/UserAccess?action=logout">Logout</a>
            </li>
          </xsl:when>
          <xsl:otherwise>
            <li>
              <a class="t10 m4" href="{$xmp:context-path}/jsp/MyDiamm" rel="overlay">Login</a>
            </li>
            <li class="ix">
              <a class="t10 m6" href="{$xmp:context-path}/jsp/UserAccess?action=register">Register</a>
            </li>
          </xsl:otherwise>
        </xsl:choose>
      </ul>
    </div>
  </xsl:template>

  <xsl:template name="xmv:footer">
    <div id="fs">
      <div class="r1">
        <ul class="img">
          <li>
            <a href="http://www.ox.ac.uk/" rel="external" title="University of Oxford Website (opens in a new window)">
              <img alt="Logo: University of Oxford" height="60" src="{$xmp:assets-path}/i/oxford.png" width="60" />
            </a>
          </li>
          <li>
            <a href="http://www.kcl.ac.uk/cch/" rel="external"
              title="King's College London Digital Humanities Website (opens in a new window)">
              <img alt="Logo: King's College London Digital Humanities" height="58" src="{$xmp:assets-path}/i/kcl.png"
                width="60" />
            </a>
          </li>
          <li>
            <a href="http://www.britac.ac.uk/" rel="external" title="British Academy Website (opens in a new window)">
              <img alt="Logo: British Academy" height="40" src="{$xmp:assets-path}/i/ba.png" width="126" />
            </a>
          </li>
          <li>
            <a href="http://www.bodleian.ox.ac.uk/bodley" rel="external"
              title="Bodleian Library Website (opens in a new window)">
              <img alt="Logo: Bodleian Library" height="60" src="{$xmp:assets-path}/i/bodleian.png" width="92" />
            </a>
          </li>
          <li>
            <a href="http://www.ahrc.ac.uk/" rel="external" title="AHRC Website (opens in a new window)">
              <img alt="Logo: AHRC" height="50" src="{$xmp:assets-path}/i/ahrc.png" width="213" />
            </a>
          </li>
          <li>
            <a href="http://www.itatti.it/" rel="external" title="Villa I Tatti Website (opens in a new window)">
              <img alt="Logo: Villa I Tatti" height="50" src="{$xmp:assets-path}/i/tatti.png" width="50" />
            </a>
          </li>
          <li>
            <a href="http://www.mellon.org/" rel="external"
              title="Andrew W. Mellon Foundation Website (opens in a new window)">
              <img alt="Logo: Andrew W. Mellon Foundation" height="39" src="{$xmp:assets-path}/i/awm.png" width="206" />
            </a>
          </li>
          <li>
            <a href="http://www.admin.ox.ac.uk/pras/jff/" rel="external"
              title="John Fell OUP Research Fund Website (opens in a new window)">
              <img alt="Logo: John Fell OUP Research Fund" height="60" src="{$xmp:assets-path}/i/johnfell.png"
                width="179" />
            </a>
          </li>
        </ul>
      </div>
      <div class="r2">
        <a class="gx" href="{$xmp:context-path}/" title="Return to the Homepage">
          <xsl:value-of select="$xmp:title" />
        </a>
        <ul>
          <li class="i1">
            <a href="#cs" title="#">Top of Page</a>
          </li>
          <li>
            <a href="#" title="#">Sitemap</a>
          </li>
          <li>
            <a href="/about/copyright.html" title="#">Copyright and License Information</a>
          </li>
          <li class="ix">
            <a href="/about/index.html" title="#">About this website</a>
          </li>
        </ul>
        <p>&#xa9; 2011 King's College London</p>
      </div>
    </div>
  </xsl:template>
</xsl:stylesheet>
