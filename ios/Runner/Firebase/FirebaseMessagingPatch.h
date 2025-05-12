// FirebaseMessagingPatch.h
// This file is a workaround for Firebase module import issues
#ifndef FirebaseMessagingPatch_h
#define FirebaseMessagingPatch_h

// Import individual Firebase headers instead of the umbrella header
@import FirebaseCore;
@import FirebaseMessaging;
@import FirebaseInstallations;

#endif /* FirebaseMessagingPatch_h */
