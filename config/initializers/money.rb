MoneyRails.configure do |config|
  config.default_currency = :eur  # or :gbp, :usd, etc.

  config.register_currency = {
    "priority": 1,
    "iso_code": "EUR",
    "name": "Euro",
    "symbol": "€",
    "alternate_symbols": [],
    "subunit": "Cent",
    "subunit_to_unit": 100,
    "symbol_first": false,
    "html_entity": "&#x20AC;",
    "decimal_mark": ",",
    "thousands_separator": ".",
    "iso_numeric": "978",
    "smallest_denomination": 1
  }
end
