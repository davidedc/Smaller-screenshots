# to change location of OSX screenshots:
#  https://www.hellotech.com/guide/for/how-to-change-where-screenshots-are-saved-on-mac
# to get squoosh-cli
#  https://www.npmjs.com/package/@squoosh/cli
# to get fswatch:
#  https://github.com/emcrisostomo/fswatch
#
# To use this:
#   fswatch -o -e ".*" -i "Scree.*\\.png$" . | xargs -n1 -I{} sh compress-screenshots.sh
# also you can avoid the delay from taking the screenshot to the image file being produced, see:
#   https://macmost.com/skip-mac-mojave-screenshot-delay.html

if [ ! -z "$(ls -A *.png)" ]; then


  for i in *.png; do
    filename=$(basename -- "$i")
    extension="${filename##*.}"
    filename="${filename%.*}"
    filename="${filename// /-}"
    filename="${filename//./-}"
    # Process $i
    echo $filename
    mkdir "$filename"

    squoosh-cli --resize '{"enabled":true,"width":600,"method":"lanczos3","fitMethod":"contain","premultiply":true,"linearRGB":true}' --mozjpeg '{"quality":75,"baseline":false,"arithmetic":false,"progressive":true,"optimize_coding":true,"smoothing":0,"color_space":3,"quant_table":3,"trellis_multipass":false,"trellis_opt_zero":false,"trellis_opt_table":false,"trellis_loops":1,"auto_subsample":true,"chroma_subsample":2,"separate_chroma_quality":false,"chroma_quality":75}' -d $filename -s "-squashed-600w" "$i"
    squoosh-cli --resize '{"enabled":true,"width":800,"method":"lanczos3","fitMethod":"contain","premultiply":true,"linearRGB":true}' --mozjpeg '{"quality":75,"baseline":false,"arithmetic":false,"progressive":true,"optimize_coding":true,"smoothing":0,"color_space":3,"quant_table":3,"trellis_multipass":false,"trellis_opt_zero":false,"trellis_opt_table":false,"trellis_loops":1,"auto_subsample":true,"chroma_subsample":2,"separate_chroma_quality":false,"chroma_quality":75}' -d $filename -s "-squashed-800w" "$i"

    squoosh-cli --resize '{"enabled":true,"width":600,"method":"lanczos3","fitMethod":"contain","premultiply":true,"linearRGB":true}' --quant '{"enabled":true,"zx":0,"maxNumColors":16,"dither":1}' --oxipng '{"level":3}' -d $filename -s "-squashed-16-600w" "$i"
    squoosh-cli --resize '{"enabled":true,"width":800,"method":"lanczos3","fitMethod":"contain","premultiply":true,"linearRGB":true}' --quant '{"enabled":true,"zx":0,"maxNumColors":16,"dither":1}' --oxipng '{"level":3}' -d $filename -s "-squashed-16-800w" "$i"

    squoosh-cli --resize '{"enabled":true,"width":600,"method":"lanczos3","fitMethod":"contain","premultiply":true,"linearRGB":true}' --quant '{"enabled":true,"zx":0,"maxNumColors":4,"dither":1}' --oxipng '{"level":3}' -d $filename -s "-squashed-4-600w" "$i"
    squoosh-cli --resize '{"enabled":true,"width":800,"method":"lanczos3","fitMethod":"contain","premultiply":true,"linearRGB":true}' --quant '{"enabled":true,"zx":0,"maxNumColors":4,"dither":1}' --oxipng '{"level":3}' -d $filename -s "-squashed-4-800w" "$i"

    squoosh-cli --quant '{"enabled":true,"zx":0,"maxNumColors":16,"dither":1}' --oxipng '{"level":3}' -d $filename -s "-squashed" "$i"

    mv "$i" originals
  done

fi
