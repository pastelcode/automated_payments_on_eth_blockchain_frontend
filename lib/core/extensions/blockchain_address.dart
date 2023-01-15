/// {@template core.extensions.blockchainAddress}
/// An extension to work with [String]s that are possible Blockchain addresses.
/// {@endtemplate}
extension BlockchainAddress on String {
  /// Whether this string is a valid blockchain address.
  bool get isValidBlockchainAddress {
    return RegExp(
      r'^0x[a-fA-F0-9]{40}$',
    ).hasMatch(
      this,
    );
  }
}
