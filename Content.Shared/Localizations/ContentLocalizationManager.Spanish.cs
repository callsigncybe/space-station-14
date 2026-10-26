using System.Globalization;

namespace Content.Shared.Localizations
{
    // Argentea: Spanish versions of the english-only MAKEPLURAL and MANY functions.
    public sealed partial class ContentLocalizationManager
    {
        private void AddSpanishFunctions(CultureInfo culture)
        {
            _loc.AddFunction(culture, "MAKEPLURAL", FormatMakePluralSpanish);
            _loc.AddFunction(culture, "MANY", FormatManySpanish);
        }

        private ILocValue FormatManySpanish(LocArgs args)
        {
            var count = ((LocValueNumber) args.Args[1]).Value;

            if (Math.Abs(count - 1) < 0.0001f)
                return (LocValueString) args.Args[0];

            return (LocValueString) FormatMakePluralSpanish(args);
        }

        /// <summary>
        /// Pluralizes the first word, since spanish nouns come before their modifiers
        /// ("tarjeta de identificación" -> "tarjetas de identificación").
        /// </summary>
        private ILocValue FormatMakePluralSpanish(LocArgs args)
        {
            var text = ((LocValueString) args.Args[0]).Value;
            var split = text.Split(' ', 2);

            split[0] = PluralizeSpanishWord(split[0]);
            return new LocValueString(string.Join(' ', split));
        }

        private static string PluralizeSpanishWord(string word)
        {
            if (word.Length == 0)
                return word;

            var last = char.ToLowerInvariant(word[^1]);

            // Already plural or invariable (e.g. "lunes", "tórax").
            if (last is 's' or 'x')
                return word;

            if (last is 'a' or 'e' or 'i' or 'o' or 'u' or 'á' or 'é' or 'ó')
                return word + "s";

            if (last == 'z')
                return word[..^1] + (char.IsUpper(word[^1]) ? "CES" : "ces");

            return word + (char.IsUpper(word[^1]) ? "ES" : "es");
        }
    }
}
