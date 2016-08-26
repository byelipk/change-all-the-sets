require IEx

defmodule HelloEcto.UserTest do
  use HelloEcto.ModelCase

  alias HelloEcto.User

  @valid_attrs %{bio: "content", email: "email@example.com", name: "some content", number_of_pets: 42}
  @invalid_attrs %{}

  def long_string(length) do
    Enum.reduce (1..length), "", fn(_, acc) -> acc <> "a" end
  end

  test "changeset with valid attributes" do
    changeset = User.changeset(%User{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = User.changeset(%User{}, @invalid_attrs)
    refute changeset.valid?
  end

  test "number_of_pets is not required" do
    changeset = User.changeset(%User{}, Map.delete(@valid_attrs, :number_of_pets))
    assert changeset.valid?
  end

  test "bio must be at least two characters long" do
    attrs = %{@valid_attrs | bio: "I"}
    assert {:bio, "should be at least 2 character(s)"} in errors_on(%User{}, attrs)
  end

  test "bio cannot be more than 10 characters long" do
    attrs = %{@valid_attrs | bio: long_string(11)}
    assert {:bio, "should be at most 10 character(s)"} in errors_on(%User{}, attrs)
  end

  test "email must contain at least an @" do
    attrs = %{@valid_attrs | email: "example.com"}
    assert {:email, "has invalid format"} in errors_on(%User{}, attrs)
  end
end
