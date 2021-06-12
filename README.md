This Dockerfile & scripts build a number of out-of-tree wifi modules from https://github.com/morrownr/

Thanks to @morrownr for providing reasonably nice source trees to work with; big middle finger to Realtek for making all these different modules that are just slightly different and aren't upstreamed.

It is tested with precisely one Pi kernel version, but you should be able to make it work with others by changing the variables sent to the base / cross-compiler Docker image.

It uses the following patch: https://patchwork.kernel.org/project/linux-kbuild/patch/c744107b341e487cf37139597a7775f6f62e12e8.1596702608.git.lukas@wunner.de/ which makes cross-compiling far nicer than before (and makes this whole malarkey possible).


Run `make modules` on an amd64 system with Docker installed and your user added to the `docker` group. Therefore the prerequisites are `make` and `docker`.

