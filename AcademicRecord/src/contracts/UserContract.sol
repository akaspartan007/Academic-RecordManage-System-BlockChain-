pragma solidity >=0.7.0 <0.8.0;

contract UserContract {
    struct User {
        address school;
        string name;
        string firstname;
        string lastname;
        string email;
        string designation; // Added designation field
        bool set; // Differentiates between unset and zero struct values
    }

    mapping(address => User) public users;

    function createUser(
        address _schoolAddress,
        address _userAddress,
        string memory _userName,
        string memory _firstname,
        string memory _lastname,
        string memory _email,
        string memory _designation // Include designation
    ) public {
        User storage user = users[_userAddress];
        require(!user.set, "User already exists");
        users[_userAddress] = User({
            school: _schoolAddress,
            name: _userName,
            firstname: _firstname,
            lastname: _lastname,
            email: _email,
            designation: _designation, // Store the designation
            set: true
        });
    }

    function getData(address _userAddress)
        external
        view
        returns (
            string memory,
            string memory,
            string memory,
            string memory,
            string memory
        )
    {
        User storage user = users[_userAddress];
        require(user.set, "User does not exist");
        return (user.name, user.firstname, user.lastname, user.email, user.designation);
    }
}
