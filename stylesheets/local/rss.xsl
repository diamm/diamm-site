<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet exclude-result-prefixes="#all" version="2.0" xmlns:tei="http://www.tei-c.org/ns/1.0"
  xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" xmlns:xmg="http://www.cch.kcl.ac.uk/xmod/global/1.0"
  xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xd:doc scope="stylesheet">
    <xd:desc>
      <xd:p><xd:b>Created on:</xd:b> Mar 18, 2011</xd:p>
      <xd:p><xd:b>Author:</xd:b> jvieira</xd:p>
      <xd:p>Converts the news to rss format.</xd:p>
    </xd:desc>
  </xd:doc>

  <xd:doc scope="component">
    <xd:desc>Function to convert the string dates in the news file to date-time. For more information see
      http://en.wikipedia.org/wiki/Calculating_the_day_of_the_week.</xd:desc>
    <xd:param name="str">String with date in the format: day of the month month, year, ex: 23 August, 2010</xd:param>
    <xd:return>RFC-822 date-time string</xd:return>
  </xd:doc>
  <xsl:function as="xs:string" name="xmg:string-to-date-time">
    <xsl:param as="xs:string" name="str" />

    <xsl:variable name="months"
      select="'January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'" />
    <xsl:variable name="months-table" select="0, 3, 3, 6, 1, 4, 6, 2, 5, 0, 3, 5" />
    <xsl:variable name="months-table-leap" select="6, 2, 3, 6, 1, 4, 6, 2, 5, 0, 3, 5" />
    <xsl:variable name="days-table" select="'Sun', 'Mon', 'Tues', 'Wed', 'Thu', 'Fri','Sat'" />

    <xsl:variable name="tokens" select="tokenize(replace($str, ',', ''), ' ')" />

    <xsl:variable name="day-of-month" select="xs:integer($tokens[1])" />
    <xsl:variable name="month" select="index-of($months, $tokens[2])" />
    <xsl:variable name="year" select="$tokens[3]" />
    <xsl:variable name="yy" select="xs:integer(substring($year, 3))" />

    <xsl:variable name="c" select="2 * (3 - (xs:integer(substring($year, 1, 2)) mod 4))" />
    <xsl:variable name="y" select="floor($yy div 4)" />
    <xsl:variable name="m">
      <xsl:choose>
        <xsl:when test="$yy mod 4 = 0">
          <xsl:value-of select="$months-table-leap[$month]" />
        </xsl:when>
        <xsl:otherwise>
          <xsl:value-of select="$months-table[$month]" />
        </xsl:otherwise>
      </xsl:choose>
    </xsl:variable>

    <xsl:variable name="sum" select="$day-of-month + $c + $yy + $y + $m" />
    <xsl:variable name="day-of-week" select="$days-table[($sum mod 7) + 1]" />

    <xsl:variable name="output">
      <xsl:value-of select="$day-of-week" />
      <xsl:text>, </xsl:text>
      <xsl:number format="01" value="$day-of-month" />
      <xsl:text> </xsl:text>
      <xsl:value-of select="substring($tokens[2], 1, 3)" />
      <xsl:text> </xsl:text>
      <xsl:value-of select="$year" />
      <xsl:text> 00:00:00 GMT</xsl:text>
    </xsl:variable>

    <xsl:value-of select="$output" />
  </xsl:function>

  <xsl:template match="/">
    <xsl:call-template name="news-to-rss" />
  </xsl:template>

  <xsl:template name="news-to-rss">
    <rss version="2.0" xmlns:atom="http://www.w3.org/2005/Atom">
      <channel>
        <atom:link href="http://www.diamm.ac.uk/about/news.xml" rel="self" type="application/rss+xml" />
        <title>DIAMM News</title>
        <link>http://www.diamm.ac.uk/about/news.html</link>
        <description>The latest news from DIAMMM, the Digital Image Archive of Medieval Music.</description>
        <language>en-gb</language>
        <pubDate><!-- TODO --></pubDate>
        <lastBuildDate><!-- TODO --></lastBuildDate>
        <category />
        <docs>http://www.diamm.ac.uk/about/index.html</docs>
        <generator>xMod 3.0/Apache Cocoon</generator>
        <managingEditor>diamm@music.ox.ac.uk (Julia Craig-McFeely)</managingEditor>
        <webMaster>webmaster@example.com (Real Name)</webMaster>

        <xsl:variable name="item-count" select="count(/aggregation/tei:TEI/tei:text/tei:body/tei:div)" />

        <xsl:for-each select="/aggregation/tei:TEI/tei:text/tei:body/tei:div">
          <item>
            <title>
              <xsl:value-of select="tei:head" />
            </title>
            <description>
              <xsl:value-of select="normalize-space(tei:p[2])" />
            </description>
            <pubDate>
              <xsl:value-of select="xmg:string-to-date-time(normalize-space(tei:p[1]))" />
            </pubDate>
            <guid>
              <xsl:text>http://www.diamm.ac.uk/about/news.html#item-</xsl:text>
              <xsl:value-of select="$item-count - (position() + 1)" />
            </guid>
          </item>
        </xsl:for-each>
      </channel>
    </rss>
  </xsl:template>
</xsl:stylesheet>
