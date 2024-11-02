// SPDX-License-Identifier: MIT

pragma solidity 0.8.24; //solidity version

contract SimpleStorage {
    uint256 myfavoriteNUmber; //default-0

    //uint256 [] listofFavoriteNumbers; // array of favorite number

    //new type
    struct Person {
        uint256 favoriteNumber;
        string name;
    }
    //dynamic array
    Person[] public listofPeople;

    //    Person public Pat = Person({
    //     favoriteNUmber :7,
    //     name: "Pat"
    //    });
    mapping(string => uint256) public nameToFavoriteNumber;

    function store(uint256 _favoriteNumber) public {
        myfavoriteNUmber = _favoriteNumber;
    }

    //view - only reading the state not changing does not allow any modification
    function retreive() public view returns (uint256) {
        //it does not cost untill it is call by another transaction function
        return myfavoriteNUmber;
    }
    //memory - can be modified 
    //caldata - cannot be modified
    function addPerson(string memory _name , uint256 _favoriteNumber) public {
        listofPeople.push(Person(_favoriteNumber ,_name));
        nameToFavoriteNumber[_name] = _favoriteNumber;
    }
}
