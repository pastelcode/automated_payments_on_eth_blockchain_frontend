/// {@template member}
/// A member for the contract.
/// {@endtemplate}
class Member {
  ///
  const Member({
    required this.address,
    required this.percent,
  });

  /// This member's wallet address.
  final String address;

  /// The percent this member is going to pay over the contract.
  final String percent;
}
