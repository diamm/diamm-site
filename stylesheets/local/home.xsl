<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet exclude-result-prefixes="#all" version="2.0"
  xmlns="http://www.w3.org/1999/xhtml" xmlns:math="java.lang.Math"
  xmlns:tei="http://www.tei-c.org/ns/1.0"
  xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl"
  xmlns:xmg="http://www.cch.kcl.ac.uk/xmod/global/1.0"
  xmlns:xmm="http://www.cch.kcl.ac.uk/xmod/menu/1.0"
  xmlns:xmp="http://www.cch.kcl.ac.uk/xmod/properties/1.0"
  xmlns:xms="http://www.cch.kcl.ac.uk/xmod/spec/1.0"
  xmlns:xmv="http://www.cch.kcl.ac.uk/xmod/views/1.0"
  xmlns:xs="http://www.w3.org/2001/XMLSchema"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:import href="default.xsl" />

  <xd:doc scope="stylesheet">
    <xd:desc>
      <xd:p><xd:b>Created on:</xd:b> Apr 06, 2011</xd:p>
      <xd:p><xd:b>Author:</xd:b> jvieira</xd:p>
      <xd:p>Stylesheet to display the home page.</xd:p>
    </xd:desc>
  </xd:doc>

  <xsl:variable name="xmg:title" select="DIAMM" />

  <xsl:template match="/">
    <xsl:apply-imports />
  </xsl:template>

  <xsl:template name="xms:content">
    <xsl:variable name="image-pos"
      select="round(((math:random() * 10) + 1) div 2)" />
    <!--<xsl:variable name="image-pos" select="if ($random > 0) then $random else xs:integer(1)" />-->

    <div class="hdp">
      <h1>Welcome to DIAMM</h1>
    </div>
    <div class="ims">
      <xsl:for-each select="/aggregation/images/image[$image-pos]">
        <img alt="{caption}" height="282"
          src="{$xmp:images-path}/local/full/{@xml:id}" title="{caption}"
          width="700" />
        <p>
          <xsl:value-of select="caption" />
          <a href="{url}">More about this image</a>
        </p>
      </xsl:for-each>
    </div>
    <div class="g n3">
      <div class="u u1">
        <h3>Recently added images</h3>
        <ul class="itl m0">
          <xsl:for-each select="/aggregation/xml/recentImages/image">
            <li>
              <a href="/{linkurl}">
                <img alt="{description}" height="60" src="{url}" width="60" />
              </a>
              <h4>
                <xsl:value-of select="title" />
              </h4>
              <p>
                <xsl:value-of select="description" />
              </p>
            </li>
          </xsl:for-each>
        </ul>
      </div>
      <div class="u u2">
        <h3>Donate to DIAMM</h3>
        <p>DIAMM is dedicated to keeping this resource free to all users but we
          have no funding to allow us to do this. If you would like to help keep
          DIAMM free, please DONATE to help us stay online and keep adding to
          the image collection.</p>
        <a class="bns" href="{$xmp:context-path}/about/donations.html">Donate
          Now</a>
        <!-- INSERT LINK TO http://diamm2-stg.cch.kcl.ac.uk:51519/diamm/about/donations.html -->
      </div>
      <div class="u u3">
        <h3>Recent Comments</h3>
        <ul class="itl m2">
          <xsl:for-each select="/aggregation/xml/recentComments/note">
            <li>
              <a href="/{link}">
                <xsl:value-of
                  select="substring-before(normalize-space(timestamp), ' ')" />
              </a>
              <p>
                <xsl:sequence select="noteText" />
              </p>
            </li>
          </xsl:for-each>
        </ul>
      </div>
    </div>
  </xsl:template>

  <xsl:template name="xmv:body">
    <body id="t0">
      <div id="gw">
        <div id="hs">
          <!-- banner -->
          <xsl:call-template name="xmv:banner" />

          <!-- top navigation: menu-top.xsl -->
          <xsl:if test="$xmg:menu-top = true()">
            <xsl:call-template name="xmm:menu-top" />
          </xsl:if>
        </div>

        <div id="cs" style="overflow:hidden">
          <div class="cg n2">
            <!-- content: local stylesheets -->
            <div class="m">
              <div class="c c1">
                <xsl:call-template name="xms:content" />
              </div>
            </div>

            <div class="c c2">
              <h3>DIAMM on Twitter</h3>
              <div id="twitter">&#160;</div>
              <!--<h3>News</h3>
              <ul class="itl m1">
                <xsl:variable name="item-count"
                  select="count(/aggregation/news/tei:TEI/tei:text/tei:body/tei:div)"/>
                <xsl:for-each
                  select="/aggregation/news/tei:TEI/tei:text/tei:body/tei:div[3 > position()]">
                  <li>
                    <h4>
                      <xsl:value-of select="tei:head"/>
                    </h4>
                    <p>
                      <xsl:value-of select="substring(tei:p[2], 1, 100)"/>
                      <xsl:text> </xsl:text>
                      <a
                        href="{$xmp:context-path}/about/news.html#item-{$item-count - count(preceding-sibling::tei:div)}"
                        >Read More</a>
                    </p>
                  </li>
                </xsl:for-each>
              </ul>
             <!-\- DO WE NEED THIS IN ADDITION TO 'READ MORE' (ABOVE)? <a class="m0" href="{$xmp:context-path}/about/news.html">More</a>-\-> -->
              <h3>DIAMM Publications</h3>
              <ul class="itl m0">
                <li>
                  <img alt="" height="60"
                    src="{$xmp:images-path}/local/full/PubsEton.png" width="60" />
                  <h4>The Eton Choirbook</h4>
                  <p>Full colour facsimile of one of the most famous of late
                    Medieval Choirbooks, with introductory study by Magnus
                    Williamson. Professionally copied and illuminated and
                    preserving works by Fayrfax, Cornyshe, Browne etc.</p>
                </li>
                <li>
                  <!--<img alt="" height="60" src="{$xmp:images-path}/i/diamm.jpg" width="60"/>-->
                  <img alt="" height="60"
                    src="{$xmp:images-path}/local/full/PubsDow.png" width="60" />
                  <h4>The Dow Partbooks</h4>
                  <p>Full colour facsimile of the six partbooks copied in the
                    exquisite hand of Robert Dow c. 1580, with an introduction
                    by John Milsom. A major source for the works of Byrd,
                    Tallis, White etc.</p>
                </li>
              </ul>
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
</xsl:stylesheet>
