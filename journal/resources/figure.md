## Yaya way Navigating through Visuals


1. First present your figure with the img and a div tag 
```html
<img src="<path-to-img>">
<div align="center" style="font-weight: bold; margin-bottom:12px; padding-top:0px">

Fig X.0: Name It not Yaya

</div>
```

2. Add an HTML anchor with an `ID` to the `<div>` element you want to link to:
```html
<div id="my-div">
   <!-- Content of the div -->
</div>
```

3. Create a link in your Markdown content that references the anchor ID:
```html
[Link to My Div](#my-div)
```

4. All together - [Use Case and Reference](https://raw.githubusercontent.com/yaya2devops/aws-cloud-project-bootcamp/main/journal/week3.md)


Okay you may find the raw confusing.<br>
Let me go and explain it just for you.

Here is how I liked to one of my figures;
```md
## Table Of Figures
- [Fig 6.0: Cruddur Stale User Interface](#staleui-figure)
```

And here how i made sure its linked;

```md
<div id="staleui-figure" align="center" style="font-weight: bold; margin-bottom:12px; padding-top:0px">Fig 6.0: Cruddur Stale User Interface </div>
```

I just went on top and added the actual figure.
```md
<img src="assets/Week3/Cognito JWT/Token/37 something is wrong.png">
```

While the image appears at the top, it's actually the `<div>` element that serves as the link.

So together fogether, should be this;

```md
<img src="assets/Week3/Cognito JWT/Token/37 something is wrong.png">
<div id="staleui-figure" align="center" style="font-weight: bold; margin-bottom:12px; padding-top:0px">Fig 6.0: Cruddur Stale User Interface </div>
```
|💡|Please disregard the unconventional asset naming|
|--|--|

Also, remember to avoid using spaces when naming assets. Thank me later!

> [Go try and feel the touch in week 3;](../week3.md#table-of-figures)