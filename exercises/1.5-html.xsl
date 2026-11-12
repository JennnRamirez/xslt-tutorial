<?xml version="1.0" encoding="UTF-8"?>
<!--
  1.5 The programme as a web page

  Problem: the team wants a simple web page of the programme with some rules.

  TODO 0: Run it without changes first. Result should be a basic page with one heading per
          session.
          
  TODO 1: In the session template, show the date, time, and room under the title,
          like this: 2026-11-12, 09:05-09:50, at L016.
          Here are some ways to do it. Try at least A and C, and compare:

        A  <p><xsl:value-of select="@date | @start | @end | @room"/></p>
        B  <p><xsl:value-of select="@date"/>, <xsl:value-of select="@start"/>-<xsl:value-of select="@end"/>, at <xsl:value-of select="@room"/></p>
        C  <p>{@date}, {@start}-{@end}, at {@room}</p>
        D  <p><xsl:value-of select="concat(@date, ', ', @start, '-', @end, ', at ', @room)"/></p>


  TODO 2: Output the speaker's name in a <p> with 'class="speaker"' using a template.
          (hint: there may be an error in your template call!)

  EXTRAS:
    - Add a <style> to your html to make it look nicer. Its curly brackets have to be
      written twice: body {{ font-family: sans-serif; }}
    - Give each session's div a second class with its track like: class="session tutorial"

-->

<xsl:stylesheet version="3.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" expand-text="yes">

  <xsl:output method="html" version="5"/>

  <xsl:template match="/programme">
    <html>
      <head>
        <title>Declarative Amsterdam 2026</title>
      </head>
      <body>
        <h1>Declarative Amsterdam 2026</h1>
        <xsl:apply-templates select="session"/>
      </body>
    </html>
  </xsl:template>

  <xsl:template match="session">
    <div class="session">
      <h2>{title}</h2>

      <!-- TODO 1: date, time and room go here -->
      
      <xsl:apply-templates select="speakers"/>
      <p class="abstract">{abstract}</p>
    </div>
  </xsl:template>

  <xsl:template match="speaker">
    <!-- TODO 2: output the speaker's name here -->
 
  </xsl:template>

</xsl:stylesheet>
