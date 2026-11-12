<?xml version="1.0" encoding="UTF-8"?>
<!--
  2.5 Sorting: sessions in the wrong order
  
  Problem: the sessions come out in the order they are in the file, and the
  two days are mixed together.

  TODO 1: Sort the session blocks by date, and then by start time. 
          (hint: xsl:sort goes INSIDE the apply-templates, as its first child.) 
            
  TODO 2: Try other sort keys: title, then the speaker's name. For the speaker,
          
  TODO 3: Try order="descending" on one of the keys.
  
  TODO 4: Sort the overview list's for-each the same way (date, then start).
  
-->
<xsl:stylesheet version="3.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    expand-text="yes">

  <xsl:output method="html" version="5"/>

  <!-- Set from outside, e.g. in the Oxygen scenario. 'all' is the default. -->
  <xsl:param name="room" select="'all'"/>

  <xsl:template match="/programme">
    <!-- Keep a session if we want all rooms, or if it's in the room we asked for -->
    <xsl:variable name="sessions" select="session[$room = 'all' or @room = $room]"/>
    <!-- Only the tutorials and symposium talks: no breaks, no openings -->
    <xsl:variable name="talks" select="$sessions[@track = 'tutorial' or @track = 'symposium']"/>
    <html>
      <head>
        <title>Declarative Amsterdam 2026</title>
      </head>
      <body>
        <h1>{if ($room = 'all') then 'Full programme' else 'Programme for ' || $room}</h1>
        <p>{count($sessions)} sessions, {count($talks)} talks and tutorials</p>
        <!-- The overview list is only for the full programme -->
        <xsl:if test="$room = 'all'">
          <h2>Overview</h2>
          <ul class="overview">
            <!-- TODO 4: sort this list too -->
            <xsl:for-each select="$sessions">
              <li><xsl:call-template name="time-range"/>: {title}</li>
            </xsl:for-each>
          </ul>
        </xsl:if>
        <!-- TODO 1: sort the session blocks -->
        <xsl:apply-templates select="$sessions"/>
      </body>
    </html>
  </xsl:template>

  <xsl:template match="session">
    <div class="session">
      <h2>{title}</h2>
      <p>{@date}, <xsl:call-template name="time-range"/>, at {@room}</p>
      <xsl:if test="speaker">
        <p class="label">{if (count(speaker) eq 1) then 'Speaker:' else 'Speakers:'}</p>
      </xsl:if>
      <xsl:apply-templates select="speaker"/>
      <xsl:apply-templates select="abstract"/>
    </div>
  </xsl:template>

  <xsl:template match="speaker">
    <p class="speaker">{name}<xsl:apply-templates select="affiliation"/></p>
  </xsl:template>

  <!-- Only runs when there is an affiliation, so no test is needed -->
  <xsl:template match="affiliation"> ({.})</xsl:template>

  <!-- Push: hand the abstract's content to the rules -->
  <xsl:template match="abstract">
    <p class="abstract"><xsl:apply-templates/></p>
  </xsl:template>

  <xsl:template match="bold">
    <b><xsl:apply-templates/></b>
  </xsl:template>

  <xsl:template match="italics">
    <i><xsl:apply-templates/></i>
  </xsl:template>

  <!-- Called by name. The context node doesn't change, so @start and @end
       still belong to the session that called it. -->
  <xsl:template name="time-range">
    <xsl:param name="from" select="@start"/>
    <xsl:param name="to" select="@end"/>
    <xsl:text>{$from}-{$to}</xsl:text>
  </xsl:template>

</xsl:stylesheet>
