// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

interface IOOP {

    function foo() external virtual;

}

abstract contract AOOP {
    uint256 private number = 10000;

    function number() public view returns(uint256) {
        return number
    }

    function foo() public virtual;
}

contract OOPParent is AOOP {

    // constructor() {

    // }

    function foo() public pure returns(uint256) {
        return 1000;
    }

    function foo1() public virtual {}
    function foo2() private {}
    function foo3() internal virtual {}
    function foo4() external virtual {}

}

contract OOP is OOPParent {
    // constructor() {
    //     super();
    // }

    function foo3() internal override {}
}





contract A {
    function foo() public virtual {}
}

contract B {
    function foo() public virtual {}
}

contract C is A, B {
    function baz() public {
        foo();
    }
    function foo() public override(A, B) {}
}