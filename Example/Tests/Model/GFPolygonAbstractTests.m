/*
*   GFPolygonAbstractTests.m
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
*   Created by Tony Stone on 09/08/2015.
*/

#import <GeoFeatures/GFPolygonAbstract.h>
#import <XCTest/XCTest.h>

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"

@interface GFPolygonAbstractTestSubClass : GFPolygonAbstract
@end
@implementation GFPolygonAbstractTestSubClass
@end

@interface GFPolygonAbstractTests : XCTestCase
@end

@implementation GFPolygonAbstractTests

    - (void)testConstruction {
        XCTAssertThrows([[GFPolygonAbstract alloc] init]);
    }

    - (void)testConstruction_Subclass {
        XCTAssertNotNil([[GFPolygonAbstractTestSubClass alloc] init]);
    }

@end

#pragma clang diagnostic pop

