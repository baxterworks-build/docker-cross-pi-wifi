This Dockerfile & scripts build a number of out-of-tree wifi modules from https://github.com/morrownr/

Thanks to @morrownr for providing reasonably nice source trees to work with; big middle finger to Realtek for making all these different modules that are just slightly different and aren't upstreamed.

It is tested with precisely one Pi kernel version, but you should be able to make it work with others by changing the variables sent to the base / cross-compiler Docker image.

