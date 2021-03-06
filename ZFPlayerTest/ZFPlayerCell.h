//
//  ZFPlayerCell.h
//
// Copyright (c) 2016年 任子丰 ( http://github.com/renzifeng )
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

#import <UIKit/UIKit.h>
#import "ZFPlayer.h"
#import "ZFVideoModel.h"

/** 播放按钮block */
typedef void(^PlayBtnCallBackBlock)(UIButton *);

@interface ZFPlayerCell : UITableViewCell

@property (weak, nonatomic  ) IBOutlet UIImageView          *avatarImageView;
@property (weak, nonatomic  ) IBOutlet UIImageView          *picView;
@property (weak, nonatomic  ) IBOutlet UILabel              *titleLabel;

@property (nonatomic, strong) UIButton                      *playBtn;

/** model */
@property (nonatomic, strong) ZFVideoModel                  *model;

/** 播放按钮block */
@property (nonatomic, copy  ) PlayBtnCallBackBlock          playBlock;

@end
