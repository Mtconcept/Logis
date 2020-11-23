class SendEmailModel {
    SendEmailModel({
        this.emailAddress,
    });

    String emailAddress;

    factory SendEmailModel.fromJson(Map<String, dynamic> json) => SendEmailModel(
        emailAddress: json["emailAddress"],
    );

    Map<String, dynamic> toJson() => {
        "emailAddress": emailAddress,
    };
}
