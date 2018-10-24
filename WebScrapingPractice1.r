# http://uc-r.github.io/scraping
# http://127.0.0.1:29591/library/XML/html/00Index.html


library("magrittr")
library("XML")

# getHTMLExternalFiles("https://www.gutenberg.org/files/1184/")   #doesn't work 
# getHTMLLinks("https://www.gutenberg.org/files/1184/")           #doesn't work
getHTMLExternalFiles("http://www.gutenberg.org/files/1184/")
getHTMLLinks("http://www.gutenberg.org/files/1184/")
CountURL <- "http://www.gutenberg.org/ebooks/1184"
getHTMLLinks(CountURL)
getHTMLExternalFiles(CountURL)
CountURL2 <- "http://www.gutenberg.org/files/1184/1184-0.txt"
getHTMLLinks(CountURL2)
getHTMLExternalFiles(CountURL2)
# command line (windows):
# R:
# cd Audiobooks
# ls -a
# mkdir CountOfMonteCristo
file <- "R:/Audiobooks/CountOfMonteCristo/1184-0.txt"
download.file(CountURL2, file)

#install.packages("rvest")
library("rvest")

doc1 <- read_html(CountURL2)
doc1 %>% html_node() %>% html_text()
