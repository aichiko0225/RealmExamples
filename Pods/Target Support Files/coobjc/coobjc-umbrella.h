#ifdef __OBJC__
#import <UIKit/UIKit.h>
#else
#ifndef FOUNDATION_EXPORT
#if defined(__cplusplus)
#define FOUNDATION_EXPORT extern "C"
#else
#define FOUNDATION_EXPORT extern
#endif
#endif
#endif

#import "COActor.h"
#import "COActorChan.h"
#import "COActorCompletable.h"
#import "COActorMessage.h"
#import "COChan.h"
#import "COCoroutine.h"
#import "coobjc.h"
#import "COGenerator.h"
#import "COPromise.h"
#import "co_tuple.h"

FOUNDATION_EXPORT double coobjcVersionNumber;
FOUNDATION_EXPORT const unsigned char coobjcVersionString[];

