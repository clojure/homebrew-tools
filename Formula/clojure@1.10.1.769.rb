class ClojureAT1101769 < Formula
  desc "The Clojure Programming Language"
  homepage "https://clojure.org"
  url "https://download.clojure.org/install/clojure-tools-1.10.1.769.tar.gz"
  sha256 "0522f44b24720c2d82f2e0fd4c98d6365340d382b0ff0f8fab9a2794ccd02ba1"
  license "EPL-1.0"

  bottle :unneeded

  depends_on "rlwrap"

  uses_from_macos "ruby" => :build

  def install
    system "./install.sh", prefix
  end

  test do
    ENV["TERM"] = "xterm"
    system("#{bin}/clj -M -e nil")
    %w[clojure clj].each do |clj|
      assert_equal "2", shell_output("#{bin}/#{clj} -M -e \"(+ 1 1)\"").strip
    end
  end
end
