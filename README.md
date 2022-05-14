# DRW
## Overview
The official code of the paper: [Dynamic Random Walk for Superpixel Segmentation][arxiv] (ACCV2018/IEEE TIP)

## Getting Started
To run our code:

1. Run ``MakeiFile.m" ro generate the matlab function based on our "C++ codes"

2. Setting hyperparameters of ``exampleDRW.m":

2.1. Set "k" as the superpixel number

2.2. Set "type_seed" to select our seed initialize strategy

2.3. Set "type_grad" to select seed prior (if use pb, please firstly download the source code of pb edge detection)

3. Run the code.


## Citation

If you find our work useful in your research, please cite:

@inproceedings{DRW_ACCV,
  title={Dynamic Random Walk for Superpixel Segmentation},
  author={Zhu, Lei and Kang, Xuejing and Ming, Anlong and Zhang, Xuesong},
  booktitle={Asian Conference on Computer Vision},
  pages={540--554},
  year={2018},
  organization={Springer}
}

@article{DRW_TIP,
  title={Dynamic random walk for superpixel segmentation},
  author={Kang, Xuejing and Zhu, Lei and Ming, Anlong},
  journal={IEEE Transactions on Image Processing},
  volume={29},
  pages={3871--3884},
  year={2020},
  publisher={IEEE}
}

[arxiv]: https://ieeexplore.ieee.org/abstract/document/8967213/
