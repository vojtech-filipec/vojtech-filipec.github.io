## Capital vs. lowcase letters:
Stay low: my local repo distinguishes the case; GitHub does not (ReadMe = readme) but after Jekyll's conversion, the case-sensitivty occurs again (orechy.JPG ~= orechy.jpg).

## Images
syntax:
`![alternative text](URL)	 ... resizes the image  

rotation:
`{: style="transform:rotate(90deg);"}` ... places an image over the text!


example:
`Testovaci obrazek orechovky: ![orechovka hotova](../assets/orechovka/pernikova_chaloupka3.jpg){: width="150" height="100" style="float:right; padding:16px"}`
see https://github.com/vojtech-filipec/vojtech-filipec.github.io/commit/eb617af9d12fde8c8244443bb8c60950016c585d
or the previous for no size parameters

- the rendering is responsive
- without size parametrs, the image is displayed page-wide
- file size remains: the image keeps its the actual size, no matter how small/large resizing is set (image info from browser: "800px × 533px (scaled to 150px × 100px)")


## Showing formulae in HTML:
Jekyll does not seem to support LaTex syntax. After a while, I found this way the best:
https://stackoverflow.com/questions/11256433/how-to-show-math-equations-in-general-githubs-markdownnot-githubs-blog


Either *Simple Inline*:
> For quick and simple inline items use HTML ampersand entity codes. An example that combines this idea with subscript text in markdown is: hθ(x) = θo x + θ1x, the code for which follows.
> `h<sub>&theta;</sub>(x) = &theta;<sub>o</sub> x + &theta;<sub>1</sub>x`
> HTML ampersand entity codes for common math symbols can be found [here](http://sites.psu.edu/symbolcodes/codehtml/#math). Codes for Greek letters [here](https://www.keynotesupport.com/websites/greek-letters-symbols.shtml).

or Complex Scalable *Inline Rendering with LaTeX and Codecogs*

> If your needs are greater use an external LaTeX renderer like [CodeCogs](https://www.codecogs.com/latex/eqneditor.php). Create an equation with CodeCogs editor. Choose svg for rendering and HTML for the embed code. Svg renders well on resize. HTML allows LaTeX to be easily read when you are looking at the source. Copy the embed code from the bottom of the page and paste it into your markdown.
> `<img src="https://latex.codecogs.com/svg.latex?\Large&space;x=\frac{-b\pm\sqrt{b^2-4ac}}{2a}" title="\Large x=\frac{-b\pm\sqrt{b^2-4ac}}{2a}" />`

**Another option**:
see the NIST Engineering Handbook what script they allow (MathJax) and how the code is written: view-source:https://www.itl.nist.gov/div898/handbook/pri/section5/pri5323.htm

## Embedded HTML 
The `include` tag allows you to include the content from another file stored in the `_includes` folder:

`{% include sas_outputs/DOE_ordinal_regression-results-brief.html %}`

parameter:
max-width="200px" 

It is good to adjust the HTML by deleting unnecesary sections; compare the the DOE_* output between 
C:\Users\Vojta\D-private\blog-github\_includes\sas_outputs
a 
C:\Users\Vojta\D-private\statistika\DOE - design of experiments\SAS code for orechovka\
