# net_info
a small bash script to get network information.

## Getting Started
the script checks if **`ifconfig`** command is installed and use it to get the following data:
- Network Card
- IP Address
- MAC Address
in case **`ifconfig`** command is not installed, the script use iproute2 to get the information.

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details
