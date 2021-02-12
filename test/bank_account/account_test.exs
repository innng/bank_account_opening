defmodule BankAccount.AccountTest do
  use BankAccount.DataCase

  alias BankAccount.Account

  describe "users" do
    alias BankAccount.Account.User

    @valid_attrs %{
      birth_date: ~D[2021-02-11],
      city: "some city",
      country: "some country",
      cpf: "000.000.000-00",
      email: "test@test.com",
      gender: "other",
      is_completed: true,
      name: "some name",
      referral_code: 42,
      state: "some state"
    }
    @update_attrs %{
      birth_date: ~D[2021-02-12],
      city: "some updated city",
      country: "some updated country",
      cpf: "000.000.000-01",
      email: "test@test",
      gender: "woman",
      is_completed: false,
      name: "some updated name",
      referral_code: 43,
      state: "some updated state"
    }
    @invalid_attrs %{
      birth_date: nil,
      city: nil,
      country: nil,
      cpf: nil,
      email: nil,
      gender: nil,
      is_completed: nil,
      name: nil,
      referral_code: nil,
      state: nil
    }

    def user_fixture(attrs \\ %{}) do
      {:ok, user} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Account.create_user()

      user
    end

    test "list_users/0 returns all users" do
      user = user_fixture()
      assert Account.list_users() == [user]
    end

    test "get_user!/1 returns the user with given id" do
      user = user_fixture()
      assert Account.get_user!(user.id) == user
    end

    test "create_user/1 with valid data creates a user" do
      assert {:ok, %User{} = user} = Account.create_user(@valid_attrs)
      assert user.birth_date == ~D[2021-02-11]
      assert user.city == "some city"
      assert user.country == "some country"
      assert user.cpf == "000.000.000-00"
      assert user.email == "test@test.com"
      assert user.gender == "other"
      assert user.is_completed == true
      assert user.name == "some name"
      assert user.referral_code == 42
      assert user.state == "some state"
    end

    test "create_user/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Account.create_user(@invalid_attrs)
    end

    test "update_user/2 with valid data updates the user" do
      user = user_fixture()
      assert {:ok, %User{} = user} = Account.update_user(user, @update_attrs)
      assert user.birth_date == ~D[2021-02-12]
      assert user.city == "some updated city"
      assert user.country == "some updated country"
      assert user.cpf == "000.000.000-01"
      assert user.email == "test@test"
      assert user.gender == "woman"
      assert user.is_completed == false
      assert user.name == "some updated name"
      assert user.referral_code == 43
      assert user.state == "some updated state"
    end

    test "update_user/2 with invalid data returns error changeset" do
      user = user_fixture()
      assert {:error, %Ecto.Changeset{}} = Account.update_user(user, @invalid_attrs)
      assert user == Account.get_user!(user.id)
    end

    test "delete_user/1 deletes the user" do
      user = user_fixture()
      assert {:ok, %User{}} = Account.delete_user(user)
      assert_raise Ecto.NoResultsError, fn -> Account.get_user!(user.id) end
    end

    test "change_user/1 returns a user changeset" do
      user = user_fixture()
      assert %Ecto.Changeset{} = Account.change_user(user)
    end
  end
end
