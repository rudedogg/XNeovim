/**
 * Tae Won Ha - http://taewon.de - @hataewon
 * See LICENSE
 */

@import Foundation;


@class NeoVimBuffer;


NS_ASSUME_NONNULL_BEGIN

@interface NeoVimWindow : NSObject <NSCoding>

@property (nonatomic, readonly) NSInteger handle;
@property (nonatomic, readonly) NeoVimBuffer *buffer;

- (instancetype)initWithHandle:(NSInteger)handle buffer:(NeoVimBuffer *)buffer;

- (instancetype)initWithCoder:(NSCoder *)coder;
- (void)encodeWithCoder:(NSCoder *)coder;

- (NSString *)description;

@end

NS_ASSUME_NONNULL_END
