//
//  TSTDebug.m
//  TestApp
//
//  Created by Michael Reneer on 3/10/15.
//  Copyright © 2016 Michael Reneer. All rights reserved.
//

#import "TSTDebug.h"
#include <mach/mach_time.h>

void TSTDebugPrintPerformanceMetrics(uint64_t start_time, uint64_t end_time) {
	static mach_timebase_info_data_t info;

	if (info.denom == 0) {
		mach_timebase_info(&info);
	}

	uint64_t elapsed_time = end_time - start_time;
	uint64_t elapsed_milliseconds = (elapsed_time * info.numer) / info.denom / 1000000;

	printf("%s, %llu\n", __PRETTY_FUNCTION__, elapsed_milliseconds);
}
