<?xml version="1.0" encoding="UTF-8"?>
<!-- adapted from https://github.com/getnikola/nikola/blob/master/nikola/data/themes/base/assets/xml/rss.xsl -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:atom="http://www.w3.org/2005/Atom" xmlns:dc="http://purl.org/dc/elements/1.1/" version="1.0">
   <xsl:output method="xml"/>
   <xsl:template match="/">
      <html xmlns="http://www.w3.org/1999/xhtml" lang="pt">
         <head>
            <meta charset="UTF-8"/>
            <meta name="viewport" content="width=device-width"/>
	    <title><xsl:value-of select="rss/channel/title"/> (RSS)</title>
	    <link rel="stylesheet" href="https://cdn.simplecss.org/simple.css"/>
	    <link rel="icon" href="/images/favicon.png" />
         </head>
         <body>
            <h1><xsl:value-of select="rss/channel/title"/> (RSS)</h1>
	    <p>Isso é um feed <abbr title="Really Simple Syndication">RSS</abbr>. Para se inscrever nele, copie o endereço que aparece abaixo ou na barra de endereços do seu navegador e cole onde o seu <a href="https://pt.wikipedia.org/wiki/Agregador_de_not%C3%ADcias">agregador</a> pedir por ele. O conteúdo do feed será atualizado automaticamente no seu <a href="https://pt.wikipedia.org/wiki/Agregador_de_not%C3%ADcias">agregador</a>.</p>
	    <p>Novato em feeds RSS? <a href="https://aboutfeeds.com/" title="About feeds">Aprenda mais (em inglês)</a>.</p>
            <p>
               <label for="address">Endereço do feed:</label>
               <input><xsl:attribute name="type">url</xsl:attribute><xsl:attribute name="id">address</xsl:attribute><xsl:attribute name="spellcheck">false</xsl:attribute><xsl:attribute name="value"><xsl:value-of select="rss/channel/atom:link[@rel='self']/@href"/></xsl:attribute></input>
            </p>
            <h2>Postagens recentes:</h2>
	    <p>Abaixo aparecem apenas os títulos e a data das postagens. No seu agregador, aparecerá também o texto completo. <b>Você pode acompanhar as atualizações do site apenas pelo feed se quiser.</b></p>
            <ul>
               <xsl:for-each select="rss/channel/item">
                  <li>
                     <a><xsl:attribute name="href"><xsl:value-of select="link"/></xsl:attribute><xsl:value-of select="title"/></a> em <xsl:value-of select="concat(substring(pubDate, 6, 2), '/', substring(pubDate, 9, 3), '/', substring(pubDate, 13, 5))"/>
                  </li>
               </xsl:for-each>
            </ul>
	    <p>Obrigado por usar RSS.❤️</p>
         </body>
      </html>
   </xsl:template>
</xsl:stylesheet>
