<?xml version="1.0" encoding="UTF-8"?>
<!--
  1.6 Push and pull

  Problem: In programme.xml some abstracts have <bold> and <italics> in them, they are
           missing from the output.

  TODO 1: Replace the {abstract} line with a template that outputs with
          a 'class="abstract"'. Are the formatting elements included?

  TODO 2: Create a new template for italics
          (hint: bold in html is <b> and italics is <i>)

  TODO 3: Add an overview list with titles and start times at the top of the page under the h1.
          (hint: there should be one <li> per session)
          In HTML a list is written like: 
              <ul>
                <li>list item</li>
              </ul>  

  EXTRAS:
    - Add the room to the overview list
    - Put a <bold> inside one of the titles in programme.xml. Does it come out bold?
    Why, or why not?

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
        <h2>Overview</h2>
        <!-- TODO 3: the overview list goes here -->
        
        <xsl:apply-templates select="session"/>
      </body>
    </html>
  </xsl:template>

  <xsl:template match="session">
    <div class="session">
      <h2>{title}</h2>
      <p>{@date}, {@start}-{@end}, at {@room}</p>
      <xsl:apply-templates select="speaker"/>
      
      <!-- TODO 1: replace this line -->
      <p class="abstract">{abstract}</p>
      
    </div>
  </xsl:template>
  
  <xsl:template match="speaker">
    <p class="speaker">{name}</p>
  </xsl:template>
  
  <!-- TODO 1: the abstract template goes here -->
  
  <xsl:template match="bold">
    <b><xsl:apply-templates/></b>
  </xsl:template>
  
  <!-- TODO 2: the italics template goes here -->

</xsl:stylesheet>
