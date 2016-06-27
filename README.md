# [Fashion Style in 128 Floats](http://hi.cs.waseda.ac.jp/~esimo/research/stylenet/)

[Edgar Simo-Serra](http://hi.cs.waseda.ac.jp/~esimo/), [Hiroshi Ishikawa](http://www.f.waseda.jp/hfs/indexE.html)

## Overview

This code provides an implementation of the research paper:

```
  "Fashion Style in 128 Floats: Joint Ranking and Classification using Weak Data for Feature Extraction"
  Edgar Simo-Serra and Hiroshi Ishikawa
  Conference in Computer Vision and Pattern Recognition (CVPR), 2016
```

See our [project page](http://hi.cs.waseda.ac.jp/~esimo/research/stylenet/) for more detailed information.

## License

```
  Copyright (C) <2016> <Edgar Simo-Serra>

  This work is licensed under the Creative Commons
  Attribution-NonCommercial-ShareAlike 4.0 International License. To view a copy
  of this license, visit http://creativecommons.org/licenses/by-nc-sa/4.0/ or
  send a letter to Creative Commons, PO Box 1866, Mountain View, CA 94042, USA.

  Edgar Simo-Serra, Waseda University
  esimo@aoni.waseda.jp, http://hi.cs.waseda.ac.jp/~esimo/  
```


## Dependencies

- [Torch7](http://torch.ch/docs/getting-started.html)
- [nn](https://github.com/torch/nn)
- [image](https://github.com/torch/image)

All packages should be part of a standard Torch7 install. For information on how to install Torch7 please see the [official torch documentation](http://torch.ch/docs/getting-started.html) on the subject.

## Usage

Test the model with

```
th test.lua
```

You should see a 7x7 matrix displayed on screen which are the descriptor distance values between the seven example images provided in this repository.

### Notes

- Model provided is the best performing model corresponding to "Ours Joint" in the paper.
- This was developed on a linux machine running Ubuntu 14.04 during late 2015.
- The provided code does not use GPU accelerated (trivial to change).
- Provided model and sample code is under a non-commercial creative commons license.

## Dataset

The model was trained on a "clean" subset of the [Fashion144k
dataset](http://hi.cs.waseda.ac.jp/~esimo/ja/research/fashionability/). The
dataset used will be released shortly.

## Citing

If you use this code please cite:

```
@InProceedings{SimoSerraCVPR2016,
   author    = {Edgar Simo-Serra and Hiroshi Ishikawa},
   title     = {{Fashion Style in 128 Floats: Joint Ranking and Classification using Weak Data for Feature Extraction}},
   booktitle = "Proceedings of the Conference on Computer Vision and Pattern Recognition (CVPR)",
   year      = 2016,
}
```




