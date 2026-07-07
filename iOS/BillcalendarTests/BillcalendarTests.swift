import XCTest
@testable import Billcalendar

@MainActor
final class BillcalendarTests: XCTestCase {
    func testStoreSeedsBelowFreeLimit() {
        let store = Store()
        XCTAssertLessThan(store.items.count, Store.freeLimit)
    }

    func testAddIncreasesCount() {
        let store = Store()
        let before = store.items.count
        let added = store.add(Bill())
        XCTAssertTrue(added)
        XCTAssertEqual(store.items.count, before + 1)
    }

    func testAddRespectsFreeLimit() {
        let store = Store()
        while store.items.count < Store.freeLimit {
            _ = store.add(Bill())
        }
        let added = store.add(Bill())
        XCTAssertFalse(added)
        XCTAssertEqual(store.items.count, Store.freeLimit)
    }

    func testProBypassesFreeLimit() {
        let store = Store()
        store.isPro = true
        while store.items.count < Store.freeLimit {
            _ = store.add(Bill())
        }
        let added = store.add(Bill())
        XCTAssertTrue(added)
    }

    func testDeleteRemovesItem() {
        let store = Store()
        let item = Bill()
        _ = store.add(item)
        store.delete(item)
        XCTAssertFalse(store.items.contains(item))
    }

    func testDeleteAtOffsetsRemovesItem() {
        let store = Store()
        let before = store.items.count
        store.delete(at: IndexSet(integer: 0))
        XCTAssertEqual(store.items.count, before - 1)
    }

    func testIsAtFreeLimitReflectsState() {
        let store = Store()
        XCTAssertFalse(store.isAtFreeLimit)
        while store.items.count < Store.freeLimit {
            _ = store.add(Bill())
        }
        XCTAssertTrue(store.isAtFreeLimit)
    }
}
