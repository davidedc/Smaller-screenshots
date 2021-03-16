# Smaller screenshots
 
automatically get a range of smaller candidate formats/sizes for your (big) screenshots.

# What?

When you take screenshots in OSX, by default you get a lossless .png of the screenshotted area (you can change that and pick *a* format with *a* quality setting).

Often though:

- you don't need a lossless high-quality image (i.e. big file)
- different screenshots are better squashed in different formats
- a smaller image (i.e. smaller width/height) is just fine (or even better)

I.e. often you can do with a smaller version, of lesser quality, with fewer colors, that is a small fraction of the size of the original.

This tools automatically produces a range of sizes/format/quality alternatives to choose from.

# Why?

I for example use this to embed (much much) smaller images in Tidllywiki (which base-64 encodes and embeds all of your notes' pics into a single html file, so a little regard for compactness really pays off).

# How?

It watches a specific directory for new screenshots, and when it finds one, it gets to work producing a number of good "squashed" candidates, in a range of different formats and sizes.

Please see the .sh file for more info.
