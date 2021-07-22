package org.egov.user.web.contract;

import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;
import org.egov.user.domain.model.enums.UserType;


@Getter
@AllArgsConstructor
@NoArgsConstructor
@Builder
@ToString
@Setter
public class Otp {
    private String otp;
    @JsonProperty("UUID")

    private String uuid;
    private String identity;
    private String tenantId;
    private UserType userType;

    @JsonProperty("isValidationSuccessful")
    private boolean validationSuccessful;
}
