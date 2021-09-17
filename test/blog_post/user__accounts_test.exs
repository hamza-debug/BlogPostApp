defmodule BlogPost.User_AccountsTest do
  use BlogPost.DataCase

  alias BlogPost.User_Accounts

  describe "users" do
    alias BlogPost.User_Accounts.User

    @valid_attrs %{age: 42, first_name: "some first_name"}
    @update_attrs %{age: 43, first_name: "some updated first_name"}
    @invalid_attrs %{age: nil, first_name: nil}

    def user_fixture(attrs \\ %{}) do
      {:ok, user} =
        attrs
        |> Enum.into(@valid_attrs)
        |> User_Accounts.create_user()

      user
    end

    test "list_users/0 returns all users" do
      user = user_fixture()
      assert User_Accounts.list_users() == [user]
    end

    test "get_user!/1 returns the user with given id" do
      user = user_fixture()
      assert User_Accounts.get_user!(user.id) == user
    end

    test "create_user/1 with valid data creates a user" do
      assert {:ok, %User{} = user} = User_Accounts.create_user(@valid_attrs)
      assert user.age == 42
      assert user.first_name == "some first_name"
    end

    test "create_user/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = User_Accounts.create_user(@invalid_attrs)
    end

    test "update_user/2 with valid data updates the user" do
      user = user_fixture()
      assert {:ok, %User{} = user} = User_Accounts.update_user(user, @update_attrs)
      assert user.age == 43
      assert user.first_name == "some updated first_name"
    end

    test "update_user/2 with invalid data returns error changeset" do
      user = user_fixture()
      assert {:error, %Ecto.Changeset{}} = User_Accounts.update_user(user, @invalid_attrs)
      assert user == User_Accounts.get_user!(user.id)
    end

    test "delete_user/1 deletes the user" do
      user = user_fixture()
      assert {:ok, %User{}} = User_Accounts.delete_user(user)
      assert_raise Ecto.NoResultsError, fn -> User_Accounts.get_user!(user.id) end
    end

    test "change_user/1 returns a user changeset" do
      user = user_fixture()
      assert %Ecto.Changeset{} = User_Accounts.change_user(user)
    end
  end

  describe "users" do
    alias BlogPost.User_Accounts.User

    @valid_attrs %{email: "some email", first_name: "some first_name", last_name: "some last_name", password: "some password"}
    @update_attrs %{email: "some updated email", first_name: "some updated first_name", last_name: "some updated last_name", password: "some updated password"}
    @invalid_attrs %{email: nil, first_name: nil, last_name: nil, password: nil}

    def user_fixture(attrs \\ %{}) do
      {:ok, user} =
        attrs
        |> Enum.into(@valid_attrs)
        |> User_Accounts.create_user()

      user
    end

    test "list_users/0 returns all users" do
      user = user_fixture()
      assert User_Accounts.list_users() == [user]
    end

    test "get_user!/1 returns the user with given id" do
      user = user_fixture()
      assert User_Accounts.get_user!(user.id) == user
    end

    test "create_user/1 with valid data creates a user" do
      assert {:ok, %User{} = user} = User_Accounts.create_user(@valid_attrs)
      assert user.email == "some email"
      assert user.first_name == "some first_name"
      assert user.last_name == "some last_name"
      assert user.password == "some password"
    end

    test "create_user/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = User_Accounts.create_user(@invalid_attrs)
    end

    test "update_user/2 with valid data updates the user" do
      user = user_fixture()
      assert {:ok, %User{} = user} = User_Accounts.update_user(user, @update_attrs)
      assert user.email == "some updated email"
      assert user.first_name == "some updated first_name"
      assert user.last_name == "some updated last_name"
      assert user.password == "some updated password"
    end

    test "update_user/2 with invalid data returns error changeset" do
      user = user_fixture()
      assert {:error, %Ecto.Changeset{}} = User_Accounts.update_user(user, @invalid_attrs)
      assert user == User_Accounts.get_user!(user.id)
    end

    test "delete_user/1 deletes the user" do
      user = user_fixture()
      assert {:ok, %User{}} = User_Accounts.delete_user(user)
      assert_raise Ecto.NoResultsError, fn -> User_Accounts.get_user!(user.id) end
    end

    test "change_user/1 returns a user changeset" do
      user = user_fixture()
      assert %Ecto.Changeset{} = User_Accounts.change_user(user)
    end
  end
end
