# Source
[Original data src](https://www.kaggle.com/datasets/edoardoba/world-flags)
## Columns

* name: Name of the country concerned
* area: in thousands of square km
* landmass: 
    * 1=N.America, 
    * 2=S.America, 
    * 3=Europe, 
    * 4=Africa, 
    * 4=Asia, 
    * 6=Oceania
* zone: Geographic quadrant, based on Greenwich and the Equator; 
    * 1=NE, 
    * 2=SE,
    * 3=SW, 
    * 4=NW
* language: 
    * 1=English, 
    * 2=Spanish, 
    * 3=French,
    * 4=German,
    * 5=Slavic,
    * 6=Other Indo-European,
    * 7=Chinese, 
    * 8=Arabic,
    * 9=Japanese/Turkish/Finnish/Magyar, 
    * 10=Others
* religion: 
    * 0=Catholic, 
    * 1=Other Christian, 
    * 2=Muslim, 
    * 3=Buddhist, 
    * 4=Hindu, 
    * 5=Ethnic, 
    * 6=Marxist,
    * 7=Others
* population: in round millions
* bars: Number of vertical bars in the flag
* stripes: Number of horizontal stripes in the flag
* colours: Number of different colours in the flag
* red: 0 if red absent, 1 if red present in the flag
* green: same for green
* blue: same for blue
* gold: same for gold (also yellow)
* white: same for white
* black: same for black
* orange: same for orange (also brown)
* mainhue: predominant colour in the flag (tie-breaks decided by taking the topmost hue, if that fails then the most central hue, and if that fails the leftmost hue)
* circles: Number of circles in the flag
* crosses: Number of (upright) crosses
* saltires: Number of diagonal crosses
* quarters: Number of quartered sections
* sunstars: Number of sun or star symbols
* crescent: 1 if a crescent moon symbol present, else 0
* triangle: 1 if any triangles present, 0 otherwise
* icon: 1 if an inanimate image present (e.g., a boat), otherwise 0
* animate: 1 if an animate image (e.g., an eagle, a tree, a human hand) present, 0 otherwise
* text: 1 if any letters or writing on the flag (e.g., a motto or slogan), 0 otherwise
* topleft: colour in the top-left corner (moving right to decide tie-breaks)
* botright: Colour in the bottom-left corner (moving left to decide tie-breaks)
* number of country national flag - Number of country national flags since independence date.