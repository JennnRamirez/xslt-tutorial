<?xml version="1.0" encoding="UTF-8"?>
<!--
  2.3 A printout for each room door

  Problem: each room wants a printout of only its own sessions for its door.

  TODO 1: Under xsl:output, declare a stylesheet parameter with a default:
            <xsl:param name="room" select="'all'"/>
          Mind the quotes inside the quotes: 'all' is a string.

  TODO 2: Change the select of the $sessions variable so it only keeps the
          sessions we want:
            session[$room = 'all' or @room = $room]
          Run it. Nothing changes yet: room is 'all', so every session is kept.

  TODO 3: In Oxygen, set room in the transformation scenario's Parameters
          (type the value without quotes). Run it with L016, then with
          Turing Hall. What happened?

  TODO 4: Make the h1 say "Full programme" when $room is 'all', and
          "Programme for L016" (or whichever room) otherwise - like the label in 1.7
          (hint: || joins two strings together)

  TODO 5: With xsl:if, show the overview list only on the full programme.
          A door printout doesn't need it.

  EXTRAS:
    - Try a room that doesn't exist. With xsl:if, show "No sessions in this room"
      when there are none.
-->
<xsl:stylesheet version="3.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" expand-text="yes">

  <xsl:output method="html" version="5"/>

  <!-- TODO 1: the room parameter goes here -->

  <xsl:template match="/programme">
    <!-- TODO 2: filter the sessions by room -->
    <xsl:variable name="sessions" select="session"/>
    <!-- Only the tutorials and symposium talks: no breaks, no openings -->
    <xsl:variable name="talks" select="$sessions[@track = 'tutorial' or @track = 'symposium']"/>
    <html>
      <head>
        <title>Declarative Amsterdam 2026</title>
      </head>
      <body>
        <!-- TODO 4: "Full programme" or "Programme for ..." -->
        <h1>Declarative Amsterdam 2026</h1>
        <p>{count($sessions)} sessions, {count($talks)} talks and tutorials</p>
        <!-- TODO 5: only show this list on the full programme -->
        <h2>Overview</h2>
        <ul class="overview">
          <xsl:for-each select="$sessions">
            <li>{@start}: {title}</li>
          </xsl:for-each>
        </ul>

        <xsl:apply-templates select="$sessions"/>
      </body>
    </html>
  </xsl:template>

  <xsl:template match="session">
    <div class="session">
      <h2>{title}</h2>
      <p>{@date}, {@start}-{@end}, at {@room}</p>
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

</xsl:stylesheet>
