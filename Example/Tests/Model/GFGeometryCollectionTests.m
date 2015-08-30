/*
*   GFMultiPolygonTests.m
*
*   Copyright 2015 Tony Stone
*
*   Licensed under the Apache License, Version 2.0 (the "License");
*   you may not use this file except in compliance with the License.
*   You may obtain a copy of the License at
*
*   http://www.apache.org/licenses/LICENSE-2.0
*
*   Unless required by applicable law or agreed to in writing, software
*   distributed under the License is distributed on an "AS IS" BASIS,
*   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
*   See the License for the specific language governing permissions and
*   limitations under the License.
*
*   Created by Tony Stone on 08/29/2015.
*/

#import <GeoFeatures/GeoFeatures.h>
#import <XCTest/XCTest.h>

@interface GFGeometryCollectionTests : XCTestCase
@end

@implementation GFGeometryCollectionTests

    - (void) testObjectAtIndexedSubscript {

        GFGeometryCollection * geometryCollection = [[GFGeometryCollection alloc] initWithWKT: @"GEOMETRYCOLLECTION(POLYGON((120 0,120 90,210 90,210 0,120 0)),LINESTRING(40 50,40 140))"];

        XCTAssertNoThrow(geometryCollection[0]);
        XCTAssertNoThrow(geometryCollection[1]);
        XCTAssertThrowsSpecificNamed(geometryCollection[2], NSException, NSRangeException);

        XCTAssertEqualObjects([geometryCollection[0] toWKTString], @"POLYGON((120 0,120 90,210 90,210 0,120 0))");
        XCTAssertEqualObjects([geometryCollection[1] toWKTString], @"LINESTRING(40 50,40 140)");
    }

@end