import { ethers } from "hardhat";
import { expect } from "chai";

import { Contract } from "ethers";
import "@nomiclabs/hardhat-waffle";

describe("AuctionSale", function () {
  // general setup code - getting accounts, and contract instance
  let contract: Contract;

  beforeEach(async function () {
    const AuctionSale = await ethers.getContractFactory("AuctionSale");
    const auctionSale = await AuctionSale.deploy(
      "0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266"
    );
    contract = await auctionSale.deployed();
  });

  // describe block, insert 'it' blocks here
  describe("list", function () {
    // make sure the signer is marked as the auction seller
    it("marks caller as the auction seller", async () => {
      expect(contract.signer === contract.seller);
    });

    // make sure we can create an auction with the list function
    it("can create an auction with the list function", async () => {
      const test = await contract.deployed();
      const reservePrice = ethers.utils.parseEther(String(1));

      await test.list(0, 1, reservePrice, 1);
    });

    // make sure we can bid on an auction with the bid function

    // make sure we can cancel a listing that didn't already start with the cancelList function

    // make sure we can settle a finished auction with the settle function
  });
});
